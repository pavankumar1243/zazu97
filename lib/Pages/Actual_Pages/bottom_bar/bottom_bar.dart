import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Account Page/account_page.dart';
import '../Ads Screen/ads_screen.dart';
import '../Favorites_Page/favorite_page.dart';
import '../Home_Page/home.dart';
import '../Notifications Screen/notifications_Screen.dart';

class BottomNavBar extends StatefulWidget {
  List<String> sortedReportList;
  BottomNavBar({required this.sortedReportList});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        Home(sortedReportList:widget.sortedReportList,),
        favorites_page(),
        AdsScreen(),
        NotificationScreen(),
        AccountScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems(){
      return [

        PersistentBottomNavBarItem(
          icon: Icon(Icons.house_sharp,
            size: 33,
          ),
          title: ("Home"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.black,
        ),

        PersistentBottomNavBarItem(
          icon: Icon(
            PhosphorIcons.heart,
            size: 33,
          ),
          title: ("Favourites"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.black,
        ),

        PersistentBottomNavBarItem(
          icon: const Icon(Icons.percent_sharp),
          title: ("Ads"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            PhosphorIcons.bell,
            size: 33,
          ),
          title: ("Notifications"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.black,
        ),

        PersistentBottomNavBarItem(
          icon: Icon(
            PhosphorIcons.user,
            size: 33,
          ),
          title: ("Account"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.black,
        ),
      ];
    }

    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      navBarHeight: 70,
      screens:_buildScreens(),
      items: _navBarsItems(),
      controller: controller,
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        boxShadow:   [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style6,


    );
  }
}
class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen1')),
      body: const Center(
        child: Text(
          'Screen1',
          style: TextStyle(fontSize: 33),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen2')),
      body: const Center(
        child: Text(
          'Screen2',
          style: TextStyle(fontSize: 33),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen3')),
      body: const Center(
        child: Text(
          'Screen3',
          style: TextStyle(fontSize: 33),
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen4')),
      body: const Center(
        child: Text(
          'Screen4',
          style: TextStyle(fontSize: 33),
        ),
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen5')),
      body: const Center(
        child: Text(
          'Screen5',
          style: TextStyle(fontSize: 33),
        ),
      ),
    );
  }
}