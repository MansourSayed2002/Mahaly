import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContAddProduct {
  ContAddProduct(this.crud);
  late Crud crud;

  insertproduct(
      title, price, discount, count, description, idstore, List images) async {
    var idproduct = await crud.postData(
      Applink.addproduct,
      {
        "product_title": title,
        "product_price": price,
        "product_discount": discount,
        "product_count": count,
        "product_description": description,
        "store_id": idstore,
      },
    );
    if (idproduct['status'] == 'success' && images.isNotEmpty) {
      var response;
      for (var i = 0; i < images.length; i++) {
        response = await crud.uploadfile(
            Applink.addimage,
            {
              "product_id": idproduct['idproduct'].toString(),
            },
            images[i]);
      }
      return response;
    } else {
      return idproduct['status'];
    }
  }
}
