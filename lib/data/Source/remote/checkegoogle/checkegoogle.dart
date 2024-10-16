import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ConstCheckegoogle {
  ConstCheckegoogle(this.crud);
  late Crud crud;

  getusers(egoogle) async {
    var response = await crud.postData(Applink.checkegoolge, {
      "users_egoogle": egoogle,
    });
    return response;
  }
}
