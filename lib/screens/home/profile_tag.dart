// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ProfileTag extends StatelessWidget {
  const ProfileTag({
    super.key,
    this.rating,
    this.isSelected = false,
  });
  final String? rating;
  final bool isSelected;

  String assetIcon() {
    if (rating!.toLowerCase().contains("smok") || rating == "비흡연") {
      return "assets/icons/smoking.png";
    }
    if (rating!.toLowerCase().contains("exercise") || rating == "매일 1시간 이상") {
      return "assets/icons/exercise.png";
    }
    if (rating!.toLowerCase().contains("drink") || rating == "전혀 안 함") {
      return "assets/icons/drink.png";
    }
    if (rating!.toLowerCase().contains("meet") || rating == "만나는 걸 좋아함") {
      return "assets/icons/meet.png";
    }
    if (rating!.toLowerCase().contains("face") || rating == "진지한 연애를 찾는 중") {
      return "assets/icons/face.png";
    }
    if (rating!.toLowerCase().contains("smile") || rating == "진지한 연애를 찾는 중") {
      return "assets/icons/smile.png";
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
          color: isSelected ? Colors.pink.withOpacity(0.2) : Colors.black,
          border:
              Border.all(color: isSelected ? Colors.pink : Colors.transparent),
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (assetIcon() != "")
            Image.asset(
              assetIcon(),
              height: 20,
            ),
          const SizedBox(
            width: 10,
          ),
          Text(
            rating ?? "29, 930",
            style:
                TextStyle(color: isSelected ? Colors.pink : null, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
