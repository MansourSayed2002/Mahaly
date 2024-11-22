class Applink {
//=============================BASE URL=========================================
  static const String serverlink = "http://10.0.2.2/Mahaly";

//=============================URL IMAGE=========================================

  static const String dirImageProfile = "$serverlink/Upload/profile_image";

  static const String dirImageProduct = "$serverlink/Upload/product_image";

  static const String dirImagestore = "$serverlink/Upload/store_image";

//=============================AUTH=============================================

  static const String signup = '$serverlink/Auth/signup.php';

  static const String register = '$serverlink/Auth/register.php';

  static const String checkverify = '$serverlink/Auth/Checkverifycode.php';

//=============================RESET PASSWORD===================================

  static const String checkegoolge =
      '$serverlink/resetpassword/checkegoogle.php';

  static const String checkverifyReset =
      '$serverlink/resetpassword/checkverifycode.php';

  static const String resetpassword =
      '$serverlink/resetpassword/resetpassword.php';

//=============================Profile==========================================

  static const String uploadimage = '$serverlink/profile/editimage.php';

  static const String storestatus = '$serverlink/profile/storestatus.php';

  static const String changepassword = '$serverlink/profile/changepassword.php';

  static const String editinfo = '$serverlink/profile/editinfo.php';

//=============================Store============================================

  static const String createstore = '$serverlink/store/createstore.php';

  static const String editimagestore = '$serverlink/store/editimage.php';

//=============================PRODUCT OF ADMIN=================================

  static const String addproduct = '$serverlink/admin/product/add.php';

  static const String addimage = '$serverlink/admin/product/addimage.php';

  static const String viewproduct = '$serverlink/admin/product/view.php';

  static const String productimage =
      '$serverlink/admin/product/productimage.php';

  static const String removeimage = '$serverlink/admin/product/removeimage.php';
//=============================CATEGORES========================================

  static const String addcat = '$serverlink/admin/categores/add.php';

  static const String deletecat = '$serverlink/admin/categores/delete.php';

  static const String viewcat = '$serverlink/admin/categores/view.php';

//=============================Items============================================

  static const String getitems = '$serverlink/items/view.php';
}
