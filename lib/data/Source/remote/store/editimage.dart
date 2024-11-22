import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContEditImageStore {
  ContEditImageStore(this.crud);
  late Crud crud;

  uploadimage(userid, file, image) async {
    var response = await crud.uploadfile(
        Applink.editimagestore,
        {
          "store_id": userid,
          "store_image": image,
        },
        file);
    return response;
  }
}
