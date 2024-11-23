import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContStore {
  ContStore(this.crud);

  late Crud crud;

  changeStutusOfStore(userid, status) async {
    var response = await crud.postData(Applink.storestatus, {
      "users_id": userid,
      "status": status,
    });

    return response;
  }
}
