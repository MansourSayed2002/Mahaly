import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';

class ApiError {
  String? status;
  String? message;
  StatusRequest? statusRequest;

  ApiError({this.status, this.message, this.statusRequest});

  ApiError.fromJson(Map<dynamic, dynamic> json, StatusRequest statusRequest) {
    status = json['status'];
    message = json['message'];
  }
}
