import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Network {
  String talariaUrl = "http://talaria-0.rdkcloud.com:6200/api/v2/devices";
  String tr1d1umUrl = "http://tr1d1um.rdkcloud.com:8080/api/v2/device/mac:";

  Map<String, String> authHeader = <String, String>{
    'Authorization': 'Basic dXNlcjpwYXNz',
  };

  String DeviceManufacture = "Device.DeviceInfo.Manufacturer";

  ///////////////////

  Future<dynamic> getDeviceInfo(String mac) async {
    http.Response response;
    try {
      var url = this.tr1d1umUrl + mac + '/config?names=' + this.DeviceManufacture;
      print(url);
      response = await http.get(
        url,
        headers: authHeader,
      );
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return jsonDecode(response.body);
  }
}
