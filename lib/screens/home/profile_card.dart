import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/constants.dart';
import 'package:luvit/models/user_model.dart';
import 'package:luvit/screens/home/profile_description.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  int selectedImage = 0;
  Offset? initialTapPosition;

  void _changeImage(bool isNext) {
    setState(() {
      if (isNext) {
        selectedImage = (selectedImage + 1) % widget.user.images.length;
      } else {
        selectedImage = (selectedImage - 1 + widget.user.images.length) %
            widget.user.images.length;
      }
    });
  }

  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1E1E1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xff3D3D3D),
          width: 1,
        ),
      ),
      margin: const EdgeInsets.only(left: 10),
      height: double.infinity,
      width: size.width * 0.95,
      child: Stack(children: [
        GestureDetector(
          onTapDown: (details) {
            final RenderBox box = context.findRenderObject() as RenderBox;
            final localOffset = box.globalToLocal(details.globalPosition);
            final x = localOffset.dx;

            if (x < box.size.width / 4) {
              _changeImage(false);
            } else {
              _changeImage(true);
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              widget.user.images[selectedImage],
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            top: 20,
            child: Row(
                children: List.generate(
                    widget.user.images.length,
                    (index) => Expanded(
                          child: Container(
                            height: 5,
                            margin: EdgeInsets.only(
                                left: index == 0 ? 10 : 0,
                                right: index == widget.user.images.length - 1
                                    ? 10
                                    : 10),
                            decoration: BoxDecoration(
                                color: selectedImage == index
                                    ? kPrimaryColor
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )))),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.vertical(
                    bottom: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ProfileDescription(
                        showMore: showMore || selectedImage == 1,
                        showTags: selectedImage > 1,
                        user: widget.user,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      SvgPicture.asset(
                        "assets/icons/like.svg",
                        height: 60,
                        width: 60,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          showMore = !showMore;
                        });
                      },
                      child: Icon(showMore
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down_outlined))
                ],
              ),
            ))
      ]),
    );
  }
}
