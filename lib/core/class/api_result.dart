import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/data/Model/api_error.dart';

class ApiResult<L, R> {
  static success(response) {
    return response;
  }

  static failure(response, StatusRequest status) {
    return ApiError.fromJson(response, status);
  }
}
