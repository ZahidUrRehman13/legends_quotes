import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:legends_quotes/TabScreens/categories_screen.dart';
import 'package:legends_quotes/Utils/Colors.dart';
import 'package:legends_quotes/Utils/notification.dart';
import 'package:legends_quotes/slider_screen.dart';
import 'package:legends_quotes/tab_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'Utils/Constants.dart';

int? initScreen;

const String TAG = "BackGround_Work";
const fetchBackground = "fetchBackground";
final FlutterLocalNotificationsPlugin localNotifications =
    FlutterLocalNotificationsPlugin();
int id = 0;
BuildContext? context;

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    int value = await BackGroundWork.instance._getBackGroundCounterValue();
    bool onOff = await BackGroundWork.instance._retrieveNotificationStatus();

    if (onOff == true) {
      // Notification code Here
      print('notificationTrueCall_onOff $onOff');
      Notifications().showNotification(localNotifications, _incrementCounter(),
          "Quotes of the Day", "Dream of your Life!", "Smart");
    } else {
      print('notificationFalseCall_onOff $onOff');
      Notifications().cancelAllNotifications();
    }
    if (value == 100) {
      BackGroundWork.instance._loadCounterValue(0);
      print('value reach to 100');
    } else {
      BackGroundWork.instance._loadCounterValue(value + 1);
      print('value less than 100 $value');
    }

    return Future.value(true);
  });
}

class BackGroundWork {
  BackGroundWork._privateConstructor();

  static final BackGroundWork _instance = BackGroundWork._privateConstructor();

  static BackGroundWork get instance => _instance;

  _loadCounterValue(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('BackGroundCounterValue', value);
  }

  Future<int> _getBackGroundCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    int counterValue = prefs.getInt('BackGroundCounterValue') ?? 0;
    return counterValue;
  }

  Future<bool> _retrieveNotificationStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool onOff = prefs.getBool('status') ?? false;
    return onOff;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();



  await Workmanager().initialize(
    callbackDispatcher,
  );
  await Workmanager().registerPeriodicTask(
    "1",
    fetchBackground,
    frequency: Duration(hours: 24),
    // initialDelay: Duration(minutes: 10),
    // constraints: Constraints(
    //   networkType: NetworkType.connected,
    // ),
  );
  tz.initializeTimeZones();
  final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@drawable/ic_launcher');

  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  localNotifications.initialize(initializationSettings,
      onSelectNotification: (payload) {
    if (payload != null) {
      onSelectNotification(payload);
      debugPrint('notification payload: ' + payload);
    }
  });

  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');

  runApp(MyApp());
}

Future onSelectNotification(String payload) async {
  await Navigator.push(
    context!,
    MaterialPageRoute(builder: (context) => CategoriesScreen(payload)),
  );
}

int _incrementCounter() {
  return id;
}

class MyApp extends StatelessWidget {
  bool? status;
  // This widget is the root of your application.

  Future<void> _saveNotificationStatus() async {
    final prefs = await SharedPreferences.getInstance();
    status = prefs.getBool('status') ?? false;
    log("onOFF status  : $status");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0 || initScreen == null
          ? "slider_screen"
          : "tab_screen",
      routes: {
// SliderScreen.id:(context)=> SliderScreen(),
        'slider_screen': (context) => SliderScreen(),
        // 'home_screen': (context)=> HomeScreenView(),
        'tab_screen': (context) => TabScreen(),
        'category_screen': (context) => CategoriesScreen(),
      },
    );
  }
}
