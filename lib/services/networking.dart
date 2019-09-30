import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    Response rp = await get(this.url);
    if (rp.statusCode == 200) {
      return jsonDecode(rp.body);
    } else {
      print(rp.statusCode);
    }
  }
}
