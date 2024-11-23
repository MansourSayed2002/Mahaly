import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/Links/Links.dart';

class ContItems {
  ContItems(this.crud);
  late Crud crud;

  getDataItems() async {
    var response = await crud.postData(Applink.getitems, {});
    return response;
  }
}
