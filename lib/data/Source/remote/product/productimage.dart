import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContShowProductImage {
  ContShowProductImage(this.crud);
  late Crud crud;

  getData(productid) async {
    var response = await crud.postData(
      Applink.productimage,
      {
        "product_id": productid.toString(),
      },
    );
    return response;
  }
}
