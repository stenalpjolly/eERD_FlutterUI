import 'package:erdk_enhance/device/DeviceInfo.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import '../main.dart';

class MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
    if(this.widget.deviceInfo == null) {
      this.widget.deviceInfo = new DeviceInfo(this);
      this.widget.deviceInfo.updateDeviceName();
    }
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    Wakelock.enable();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    if(this.widget.deviceInfo == null) {
      this.widget.deviceInfo = new DeviceInfo(this);
      this.widget.deviceInfo.updateDeviceName();
    }
    bool isOpen = false;
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
          WiFiAnimation(),
          BackgroundAnimation(),
          Button(),
          DeviceInfoLabel(),
        ]) /* add child content here */,
      ),
    );
  }

  Align BackgroundAnimation() {
    return Align(
      alignment: Alignment(0,0.437),
        child: Container(
          width: 200,
          height: 200,
          child: FlareActor('images/pulsing.flr',
              animation: 'stand_by'),
        )
    );
  }

  Align WiFiAnimation() {
    return Align(
          alignment: Alignment(0,0),
          child: FlareActor('images/Wifi animation.flr',
              animation: widget.isConnected ? 'loading' : ''),
        );
  }

  Align DeviceInfoLabel() {
    return Align(
          alignment: Alignment(0.0,0.7),
          child: Container(
            height: 40,
            width: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(2, 2), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(150)),
              ),
              child:Center(
                child:Text(widget.deviceInfo != null ? widget.deviceInfo.getDeviceName() : "")
              )
            ),
          ),
        );
  }

  Align Button() {
    return Align(
            alignment: Alignment(0.0, 0.4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.isConnected = !widget.isConnected;
                });
              },
              child: ButtonLabel(widget: widget),
            ));
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
          color: widget.infoDataList[widget.isConnected ? 0 : 1].btnColor.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(150)),
        ),
        child:Center(
            child: Text(
              widget.infoDataList[widget.isConnected ? 0 : 1].btnText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.amberAccent,
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
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          fontSize: widget.isConnected ? 30 : 25 ,
          color: widget.infoDataList[widget.isConnected ? 0 : 1].topTitleColor,
          fontWeight: FontWeight.bold,
        ),
        child: Text(widget.infoDataList[widget.isConnected ? 0 : 1].topTitle),
      ),
    );
  }
}