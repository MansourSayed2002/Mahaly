import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContCreateStore {
  ContCreateStore(this.crud);

  late Crud crud;

  createStore(userid, image, name, description) async {
    var response = await crud.postData(Applink.createstore, {
      "users_id": userid,
      "image": image,
      "name": name,
      "description": description,
    });

    return response;
  }
}
