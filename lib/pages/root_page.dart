import 'package:firebase_test/pages/cart/cart_page.dart';
import 'package:firebase_test/pages/home/home_page.dart';
import 'package:firebase_test/pages/profile_page.dart';
import 'package:firebase_test/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late List<Widget> pages;
  int currentPage = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pages = const [
      HomePage(),
      SearchPage(),
      CartPage(),
      ProfilePage(),
    ];
    pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        height: kBottomNavigationBarHeight,
        selectedIndex: currentPage,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: Icon(IconlyLight.home),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: Icon(IconlyLight.search),
            label: "Search",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.bag),
            icon: Badge(
              isLabelVisible: true,
              label: Text("5"),
              child: Icon(
                IconlyLight.bag,
              ),
            ),
            label: "Cart",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
            label: "Profile",
          ),
        ],
        onDestinationSelected: (value) {
          setState(() {
            currentPage = value;
          });
          pageController.jumpToPage(currentPage);
        },
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
