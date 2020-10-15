import 'dart:convert';

import 'package:erdk_enhance/InfoData.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import 'package:http/http.dart' as http;

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  List<String> connectTitle = ["NORMAL CONNECTION", "ULTRA CONNECTION"];
  List<String> btnTitle = ["UNLEASH LOKI", "LOKI ME"];
  bool isConnected = false;

  List<InfoData> infoDataList = [
    new InfoData("ULTRA CONNECTION", "LOKI ME", new Color(0xffCC3670), new Color(0x77804060), Colors.greenAccent, Colors.amber),
    new InfoData("NORMAL CONNECTION", "UNLEASH LOKI", Colors.green, new Color(0x77408071), Colors.redAccent, Colors.amber),
  ];

  // InfoData

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void setState(fn) {
    // TODO: implement setState
    Wakelock.enable();
    super.setState(fn);
    print('Enabled');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment(0.0, -0.45),
            child: Text(
              widget.infoDataList[widget.isConnected ? 0 : 1].topTitle,
              style: TextStyle(
                  color: widget.infoDataList[widget.isConnected ? 0 : 1].topTitleColor,//Colors.pinkAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
              alignment: Alignment(0.0, 0.4),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isConnected = !widget.isConnected;
                  });

                  // final Future<http.Response> response = http.get(
                  //   'http://tr1d1um.rdkcloud.com:8080/api/v2/device/mac:b827eb68d548/config?names=Device.DeviceInfo.Manufacturer',
                  //   headers: <String, String>{
                  //     'Authorization': 'Basic dXNlcjpwYXNz',
                  //   },
                  // );
                  // response.then((response) => {print(response.body)});
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(150)),
                    border: Border.all(
                        width: 10,
                        color: widget
                            .infoDataList[widget.isConnected ? 0 : 1].btnColor,
                        style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: widget.infoDataList[widget.isConnected ? 0 : 1].btnColor.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(150)),
                    ),
                    child:Center(
                        child: Text(
                          widget.infoDataList[widget.isConnected ? 0 : 1].btnText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ))
        ]) /* add child content here */,
      ),
    );
  }
}
