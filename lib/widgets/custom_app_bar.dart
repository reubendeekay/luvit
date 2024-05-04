import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luvit/screens/home/profile_like_count.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        width: double.infinity,
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/location.svg",
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: Text(
                "목이길어슬픈기린님의 새로운 스팟R",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const ProfileLikeCount(
              color: Colors.pink,
              rating: "323,233",
            ),
            const SizedBox(
              width: 4,
            ),
            SvgPicture.asset(
              "assets/icons/notification.svg",
            ),
          ],
        ),
      ),
    );
  }
}
