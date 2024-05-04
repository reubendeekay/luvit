// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileLikeCount extends StatelessWidget {
  const ProfileLikeCount({
    super.key,
    this.rating,
    this.color,
  });
  final String? rating;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: color != null ? null : Colors.black,
              border: Border.all(
                  color:
                      color != null ? Colors.grey[800]! : Colors.transparent),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/star.svg",
                color: color,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(rating ?? "29, 930"),
            ],
          ),
        ),
      ],
    );
  }
}
