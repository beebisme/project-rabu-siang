import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/web_view/webview.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.imageUrl,
    required this.webUrl,
  });

  final String imageUrl, webUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MyWebView(url: webUrl));
      },
      child: Container(
        height: 250,
        width: 168,
        margin: const EdgeInsets.only(left: 8, right: 4),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
