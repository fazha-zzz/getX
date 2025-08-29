import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_getx/app/modules/FormPendaftaran/views/form_pendaftaran_view.dart';
import 'package:latihan_getx/app/modules/Posts/views/posts_view.dart';
import 'package:latihan_getx/app/modules/counter/views/counter_view.dart';
import 'package:latihan_getx/app/modules/post/views/post_view.dart';
import 'package:latihan_getx/app/modules/profile/views/profile_view.dart';

import '../controllers/home_controller.dart';

final List<Widget> pages = [CounterView(), PostsView(), ProfileView()];

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.exposure, title: 'Counter'),
          TabItem(icon: Icons.photo_sharp, title: 'Posts'),
          TabItem(icon: Icons.account_circle, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: controller.changepage,
      ),
    );
  }
}
