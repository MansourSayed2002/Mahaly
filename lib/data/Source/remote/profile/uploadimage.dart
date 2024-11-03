import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContUploadImage {
  ContUploadImage(this.crud);
  late Crud crud;

  uploadimage(userid, file, image) async {
    var response = await crud.uploadfile(
        Applink.uploadimage,
        {
          "users_id": userid,
          "users_image": image,
        },
        file);
    return response;
  }
}
