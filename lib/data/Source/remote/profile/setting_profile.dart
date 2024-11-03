import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContSettingProfile {
  ContSettingProfile(this.crud);

  late Crud crud;

  changeStutusOfStore(userid, status) async {
    var response = await crud.postData(Applink.storestatus, {
      "users_id": userid,
      "status": status,
    });

    return response;
  }

  changePassword(userid, oldpassword, newpassword) async {
    var response = await crud.postData(Applink.changepassword, {
      "users_id": userid,
      "oldpassword": oldpassword,
      "newpassword": newpassword,
    });

    return response;
  }
}
