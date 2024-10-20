class Applink {
//=============================BASE URL=========================================
  static const String serverlink = "http://10.0.2.2/Mahaly/";

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
}
