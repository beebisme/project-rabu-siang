import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/web_view/webview.dart';

class BookCardHorizontal extends StatelessWidget {
  const BookCardHorizontal(
      {Key? key,
      required this.title,
      required this.author,
      required this.description,
      required this.imgUrl,
      required this.webUrl})
      : super(key: key);

  final String title, author, description, imgUrl, webUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => MyWebView(url: webUrl)),
      child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(image: NetworkImage(imgUrl))),
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'roboto',
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      author,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'roboto'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
