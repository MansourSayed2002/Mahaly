import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContRemoveProductImage {
  ContRemoveProductImage(this.crud);
  late Crud crud;

  getData(imageid, image) async {
    var response = await crud.postData(
      Applink.productimage,
      {
        "image_id": imageid.toString(),
        'image': image.toString(),
      },
    );
    return response;
  }
}
