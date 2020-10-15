import 'package:erdk_enhance/Network.dart';

class DeviceInfo {
  String mac = "b827eb68d548";
  String deviceName = "";
  int numberOfInterfaces;
  bool isBackupActive;

  var context;

  DeviceInfo(this.context);

  updateDeviceName() {
    new Network().getDeviceInfo(this.mac).then((value) {
      this.deviceName = value['parameters'][0]['value'];
      print(this.deviceName);
      this.context.setState(() {
        this.deviceName = value['parameters'][0]['value'];
      });
    });
  }
}
