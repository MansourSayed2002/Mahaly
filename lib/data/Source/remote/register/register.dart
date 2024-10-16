import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class Contregister {
  Crud crud;
  Contregister({required this.crud});
  updateData(
    String username,
    String password,
  ) async {
    var response = await crud.postData(Applink.register, {
      "users_username": username,
      "users_password": password,
    });

    return response;
  }
}
