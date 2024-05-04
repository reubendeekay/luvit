import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luvit/screens/home/home_screen.dart';
import 'package:luvit/utils/assets.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  _handleTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    const Homepage(),
    const Homepage(),
    const Homepage(),
    const Homepage(),
    const Homepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              border: Border(
                top: BorderSide(
                  color: Color(0xff2F2F2F),
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavBarItem(
                  icon: Assets.assetsNavHome,
                  index: 0,
                  selectedIndex: _selectedIndex,
                  onTap: _handleTap,
                  text: '홈',
                ),
                NavBarItem(
                  icon: Assets.assetsNavLocation,
                  index: 1,
                  selectedIndex: _selectedIndex,
                  onTap: _handleTap,
                  text: '스팟',
                ),
                const SizedBox(
                  width: 65,
                  height: 65,
                ),
                NavBarItem(
                  icon: Assets.assetsNavChat,
                  index: 3,
                  selectedIndex: _selectedIndex,
                  onTap: _handleTap,
                  text: '채팅',
                ),
                NavBarItem(
                  icon: Assets.assetsNavPerson,
                  index: 4,
                  selectedIndex: _selectedIndex,
                  onTap: _handleTap,
                  text: '마이',
                ),
              ],
            ),
          ),
          const Positioned(
            top: -16,
            bottom: 0,
            right: 0,
            left: 0,
            child: MainFloatingButton(),
          ),
        ],
      ),
    );
  }
}

class MainFloatingButton extends StatelessWidget {
  const MainFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xff2F2F2F),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0),
              ),
            ]),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 0.8],
              colors: [
                Color(0xff101010),
                Color(0xff2F2F2F),
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.assetsNavStar,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.index,
    required this.onTap,
    required this.selectedIndex,
    required this.icon,
    required this.text,
  });

  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call(index);
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(2.0),
        duration: const Duration(milliseconds: 300) * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon,
                colorFilter: index == selectedIndex
                    ? const ColorFilter.mode(
                        Colors.pink,
                        BlendMode.srcIn,
                      )
                    : ColorFilter.mode(
                        Theme.of(context).hintColor,
                        BlendMode.srcIn,
                      )),
            Text(
              text,
              style: TextStyle(
                color: index == selectedIndex
                    ? Colors.pink
                    : Theme.of(context).hintColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
