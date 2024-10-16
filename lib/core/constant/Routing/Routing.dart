import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mahaly/core/class/AppRouting/AppRouting.dart';
import 'package:mahaly/core/middleware/middleware.dart';
import 'package:mahaly/view/screen/Auth/Register_view.dart';
import 'package:mahaly/view/screen/Auth/SignUp_view.dart';
import 'package:mahaly/view/screen/Onboarding/Onboarding_view.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: AppRouting.onboarding,
      page: () => const Onboarding_view(),
      middlewares: [Mymiddleware()]),
  GetPage(name: AppRouting.signup, page: () => const Signup_view()),
  GetPage(name: AppRouting.register, page: () => const Register_view()),
];
