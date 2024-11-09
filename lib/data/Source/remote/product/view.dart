import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContShowProduct {
  ContShowProduct(this.crud);
  late Crud crud;

  getData(idstore) async {
    var response = await crud.postData(
      Applink.viewproduct,
      {
        "store_id": idstore,
      },
    );
    return response;
  }
}
