import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import '../main.dart';

class MyHomePageState extends State<MyHomePage> {

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: <Widget>[
          CurrentConnectionStatus(widget: widget),
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
                child: ButtonLabel(widget: widget),
              ))
        ]) /* add child content here */,
      ),
    );
  }
}

class ButtonLabel extends StatelessWidget {
  const ButtonLabel({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class CurrentConnectionStatus extends StatelessWidget {
  const CurrentConnectionStatus({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, -0.45),
      child: Text(
        widget.infoDataList[widget.isConnected ? 0 : 1].topTitle,
        style: TextStyle(
            color: widget.infoDataList[widget.isConnected ? 0 : 1].topTitleColor,//Colors.pinkAccent,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}