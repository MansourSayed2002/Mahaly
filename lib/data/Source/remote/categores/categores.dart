import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContCategores {
  ContCategores(this.crud);

  late Crud crud;

  getcat(owner) async {
    var response = await crud.postData(Applink.viewcat, {
      "owner_id": owner.toString(),
    });

    return response;
  }

  deletecat(catid) async {
    var response = await crud.postData(Applink.deletecat, {
      "cat_id": catid.toString(),
    });

    return response;
  }

  addcat(owner, namecat) async {
    var response = await crud.postData(Applink.addcat, {
      "owner": owner.toString(),
      "cat": namecat,
    });

    return response;
  }
}
