import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView') ,
        centerTitle: true,
      ),
      body: Center(
        child:Column( children: [ Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: ()  => Get.toNamed('/counter'), 
        child: Text('Go to counter')
        ),
        
        ElevatedButton(
              onPressed: () => Get.toNamed('/form-pendaftaran'),
              child: Text('Go to from pendaftaran'),
            ),
            
             ElevatedButton(
              onPressed: () => Get.toNamed('/post'),
              child: Text('Go to from post'),
            ),
      ],
      ),
      ),
    );
  }
}
