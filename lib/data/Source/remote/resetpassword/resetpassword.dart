import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContResetpassword {
  ContResetpassword(this.crud);
  late Crud crud;

  changepassword(username, newpassword) async {
    var response = await crud.postData(Applink.resetpassword, {
      "users_username": username,
      "users_password": newpassword,
    });
    return response;
  }
}
