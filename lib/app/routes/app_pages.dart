import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../modules/FormPendaftaran/bindings/form_pendaftaran_binding.dart';
import '../modules/FormPendaftaran/views/form_pendaftaran_view.dart';
import '../modules/Posts/bindings/posts_binding.dart';
import '../modules/Posts/views/posts_view.dart';
import '../modules/alqulan/bindings/alqulan_binding.dart';
import '../modules/alqulan/views/alqulan_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/post/bindings/post_binding.dart';
import '../modules/post/views/post_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.FORM_PENDAFTARAN,
      page: () => FormPendaftaranView(),
      binding: FormPendaftaranBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.POST,
      page: () => PostView(),
      binding: PostBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.ALQULAN,
      page: () => AlqulanView(),
      binding: AlqulanBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.POSTS,
      page: () => PostsView(),
      binding: PostsBinding(),
    ),
  ];
}
