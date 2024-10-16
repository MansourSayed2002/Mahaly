import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mahaly/core/class/api_result.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';

class Crud {
  postData(String path, Map body) async {
    try {
      var response = await http.post(Uri.parse(path), body: body);

      Map responsebody = jsonDecode(response.body);
      if (responsebody['status'] == 'success') {
        return ApiResult.success(responsebody);
      } else {
        return ApiResult.failure(responsebody, StatusRequest.failure);
      }
    } catch (e) {
      return ApiResult.failure(e, StatusRequest.serverException);
    }
  }
}
