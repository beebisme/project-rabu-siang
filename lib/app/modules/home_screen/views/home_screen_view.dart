// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:project/app/modules/home_screen/views/components/book_card.dart';
import 'package:project/app/modules/home_screen/views/components/book_card_horizontal.dart';
import 'package:project/app/modules/home_screen/views/components/book_loading.dart';
import 'package:project/app/modules/home_screen/views/components/book_loading_horizontal.dart';
import 'package:project/app/widget/bottom_nav.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  bool selectAllPressed = false;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dearme'),
        backgroundColor: Colors.brown,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 40,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 150,
                          height: 30,
                          child: ClipRRect(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Welcome back, User!',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'ABeeZee'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.bell,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 10, bottom: 16),
                child: Text(
                  'Popular Books',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'roboto',
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      var bookData = homeScreenController.booksList;
                      return Obx(() => bookData.isEmpty
                          ? const BookCardLoading()
                          : BookCard(
                              imageUrl: bookData[index].bookImage,
                              webUrl: bookData[index].amazonProductUrl,
                            ));
                    },
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: const Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'All Books',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'roboto',
                            ),
                          ),
                        )),
                    // Add more widgets if needed
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  var bookData = homeScreenController.booksList;
                  return Obx(() => bookData.isEmpty
                      ? const Column(
                          children: [
                            BookLoadingHorizontal(),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        )
                      : Column(
                          children: [
                            BookCardHorizontal(
                              title: bookData[index + 5].title,
                              author: bookData[index + 5].author,
                              description: bookData[index + 5].description,
                              imgUrl: bookData[index + 5].bookImage,
                              webUrl: bookData[index + 5].amazonProductUrl,
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        ));
                },
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
        onItemTapped: (index) {
          // Define what should happen when a tab is tapped here
        },
      ),
    );
  }
}
