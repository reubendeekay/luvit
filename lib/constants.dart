import 'package:flutter/material.dart';
import 'package:luvit/models/user_model.dart';

const kPrimaryColor = Color(0xFFFF016B);

final defaultUserModel = UserModel(
    age: 25,
    likeCount: 29930,
    description:
        "서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다",
    images: [
      "assets/images/image1.png",
      "assets/images/image2.png",
      "assets/images/image3.png",
    ],
    location: "서울 . 2km 거리에 있음",
    name: "잭과분홍콩나물",
    tags: [
      "진지한 연애를 찾는 중",
      "전혀 안 함",
      "비흡연",
      "매일 1시간 이상",
      "만나는 걸 좋아함",
      "INFP",
    ]);
