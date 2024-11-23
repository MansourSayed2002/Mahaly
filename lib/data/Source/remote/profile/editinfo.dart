import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContUpdateInfo {
  ContUpdateInfo(this.crud);

  late Crud crud;

  updateinfo(userid, name, username, phone, egoogle) async {
    var response = await crud.postData(
      Applink.editinfo,
      {
        "users_id": userid,
        "users_name": name,
        "users_username": username,
        "egoogle": egoogle,
        "users_phone": phone,
      },
    );
    return response;
  }
}
