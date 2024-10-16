import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class Contverify {
  Crud crud;
  Contverify({required this.crud});
  updateData(
    String verify,
    String username,
  ) async {
    var response = await crud.postData(Applink.checkverify, {
      "users_username": username,
      "users_verifycode": verify,
    });

    return response;
  }
}
