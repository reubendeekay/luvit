import 'package:flutter/material.dart';
import 'package:luvit/models/user_model.dart';
import 'package:luvit/screens/home/profile_like_count.dart';
import 'package:luvit/screens/home/profile_tag.dart';

class ProfileDescription extends StatefulWidget {
  const ProfileDescription(
      {super.key,
      this.showMore = false,
      this.showTags = false,
      required this.user});
  final bool showMore;
  final bool showTags;
  final UserModel user;
  @override
  State<ProfileDescription> createState() => _ProfileDescriptionState();
}

class _ProfileDescriptionState extends State<ProfileDescription> {
  int selectedTag = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileLikeCount(
              rating: widget.user.likeCount.toString(),
            ),
            Row(
              children: [
                Text(
                  widget.user.name,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.user.age.toString(),
                  style: const TextStyle(fontSize: 28),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            if (widget.showTags)
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 10,
                spacing: 10,
                children: widget.user.tags
                    .map((tag) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTag = widget.user.tags.indexOf(tag);
                            });
                          },
                          child: ProfileTag(
                            rating: tag,
                            isSelected:
                                selectedTag == widget.user.tags.indexOf(tag),
                          ),
                        ))
                    .toList(),
              ),
            if (!widget.showMore && !widget.showTags)
              Text(
                widget.user.location,
                style: const TextStyle(fontSize: 16),
              ),
            if (widget.showMore)
              Text(
                widget.user.description,
                style: const TextStyle(fontSize: 16),
              )
          ],
        ),
      ),
    );
  }
}
