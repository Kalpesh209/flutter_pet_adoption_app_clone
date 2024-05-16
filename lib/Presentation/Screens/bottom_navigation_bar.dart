import 'package:flutter/material.dart';
import 'package:flutter_pet_adoption_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_pet_adoption_app_clone/AppUtils/app_constants.dart';
import 'package:flutter_pet_adoption_app_clone/Presentation/Screens/chat_screen.dart';
import 'package:flutter_pet_adoption_app_clone/Presentation/Screens/home_page_screen.dart';
import 'package:flutter_pet_adoption_app_clone/Presentation/Widgets/bottombar_item_widget.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({
    super.key,
  });

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarScreen>
    with TickerProviderStateMixin {
  int _activeTab = 0;
  final List barItems = [
    {
      'icon': 'assets/icons/home-border.svg',
      'active_icon': 'assets/icons/home.svg',
      'page': HomePageScreen(),
    },
    {
      "icon": "assets/icons/pet-border.svg",
      "active_icon": "assets/icons/pet.svg",
      "page": Container(
        child: Center(
          child: Text("Pet Page"),
        ),
      ),
    },
    {
      "icon": "assets/icons/chat-border.svg",
      "active_icon": "assets/icons/chat.svg",
      "page": ChatPageScreen(),
    },
    {
      "icon": "assets/icons/setting-border.svg",
      "active_icon": "assets/icons/setting.svg",
      "page": Container(
        child: Center(
          child: Text("Setting Page"),
        ),
      ),
    },
  ];

//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: AppConstants.ANIMATED_BODY_MS),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  _buildAnimatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      _activeTab = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      body: _buildPage(),
      floatingActionButton: _buildBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        barItems.length,
        (index) => _buildAnimatedPage(barItems[index]["page"]),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
      decoration: BoxDecoration(
        color: AppColors.bottomBarColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          barItems.length,
          (index) => BottomBarItemWidget(
            _activeTab == index
                ? barItems[index]["active_icon"]
                : barItems[index]["icon"],
            isActive: _activeTab == index,
            activeColor: AppColors.primary,
            onTap: () => onPageChanged(index),
          ),
        ),
      ),
    );
  }
}
