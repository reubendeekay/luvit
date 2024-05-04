import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

import 'package:luvit/providers/dating_provider.dart';
import 'package:luvit/widgets/custom_app_bar.dart';
import 'package:luvit/screens/home/profile_card.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<DatingProvider>(context, listen: false).getDatingProfiles();
    });
  }

  bool showEmpty = false;
  @override
  Widget build(BuildContext context) {
    final profiles = context.watch<DatingProvider>().datingProfiles;

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          if (!showEmpty)
            Expanded(
              child: AppinioSwiper(
                cardsCount: profiles.length,
                onSwiping: (AppinioSwiperDirection direction) {},
                unlimitedUnswipe: true,
                threshold: 20,
                padding: EdgeInsets.zero,
                onSwipe: (index, direction) {
                  Provider.of<DatingProvider>(context, listen: false)
                      .removeDatingProfile();
                },
                swipeOptions:
                    const AppinioSwipeOptions.only(bottom: true, left: true),
                onEnd: () => setState(() {
                  showEmpty = true;
                }),
                cardsBuilder: (context, index) {
                  if (index >= profiles.length) {
                    return const SizedBox();
                  }
                  return ProfileCard(
                    user: profiles[index],
                  );
                },
              ),
            ),
          if (showEmpty) const EmptyHomeState(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class EmptyHomeState extends StatelessWidget {
  const EmptyHomeState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "추천 드릴 친구들을 준비 중이에요",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "매일 새로운 친구들을 소개시켜드려요",
              style: TextStyle(color: Color(0xffADADAD)),
            ),
          ],
        ),
      ),
    );
  }
}
