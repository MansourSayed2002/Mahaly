import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class Contsignup {
  Crud crud;
  Contsignup({required this.crud});
  updateData(
    String name,
    String username,
    String egoogle,
    String phone,
    String password,
  ) async {
    var response = await crud.postData(Applink.signup, {
      "users_name": name,
      "users_username": username,
      "users_egoogle": egoogle,
      "users_phone": phone,
      "users_password": password,
    });
    return response;
  }
}
