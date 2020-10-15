import 'package:erdk_enhance/InfoData.dart';
import 'package:erdk_enhance/device/DeviceInfo.dart';
import 'package:flutter/material.dart';
import 'device/DeviceInfo.dart';
import 'homepage/MyHomePageState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Loki: eRDK Enhance Internet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  DeviceInfo deviceInfo;
  bool isConnected = false;

  List<InfoData> infoDataList = [
    new InfoData("ULTRA CONNECTION", "LOKI ME", new Color(0xffCC3670), new Color(0x77804060), Colors.greenAccent, Colors.amber),
    new InfoData("NORMAL CONNECTION", "UNLEASH LOKI", Colors.green, new Color(0x77408071), Colors.redAccent, Colors.amber),
  ];

  @override
  MyHomePageState createState() => MyHomePageState();
}


