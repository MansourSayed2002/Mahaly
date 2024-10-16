import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/data/Model/api_error.dart';

handlingData(response) {
  if (response is ApiError) {
    return StatusRequest.failure;
  } else {
    return StatusRequest.success;
  }
}
