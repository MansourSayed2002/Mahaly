import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
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
      return ApiResult.failure({"exeption": e}, StatusRequest.serverException);
    }
  }

  uploadfile(String path, Map body, File file) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(path));

      var lenght = await file.length();
      var stream = http.ByteStream(file.openRead());
      stream.cast();

      var multiblefile = http.MultipartFile("File", stream, lenght,
          filename: basename(file.path));

      request.files.add(multiblefile);

      body.forEach((key, value) {
        request.fields[key] = value;
      });
      var myrequest = await request.send();

      var response = await http.Response.fromStream(myrequest);

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
