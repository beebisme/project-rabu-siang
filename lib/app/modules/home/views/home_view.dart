import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home/controllers/home_controller.dart';
import 'package:project/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: Container(
        // Tambahkan Container atau widget lain untuk mengelompokkan elemen
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(
                Routes.home_screen_view); // Ganti dengan rute yang sesuai
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 150.0),
            backgroundColor: Color.fromARGB(255, 174, 149, 255),
          ),
          child: Text(
            "Next",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
