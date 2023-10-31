import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BookCardLoading extends StatelessWidget {
  const BookCardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        child: Container(
      margin: const EdgeInsets.only(left: 8, right: 4),
      height: 250,
      width: 168,
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(8)),
    ));
  }
}
