import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BookLoadingHorizontal extends StatelessWidget {
  const BookLoadingHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Shimmer(
          child: Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(4)),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 10,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 10,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
