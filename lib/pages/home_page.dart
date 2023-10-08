import 'package:agriculture_app/pages/cart_page.dart';
import 'package:agriculture_app/pages/explore_page.dart';
import 'package:agriculture_app/pages/profile_page.dart';
import 'package:agriculture_app/pages/service_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pageList = const [
    ExplorePage(),
    ServicePage(),
    CartPage(),
    ProfilePage(),
  ];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          centerTitle: false,
          leading: const Icon(Icons.menu),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi HieuNguyen !!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Enjoy our service',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton.filledTonal(
                onPressed: () {},
                icon: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -15, end: -12),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.green,
                  ),
                  badgeContent: const Text('2'),
                  child: const Icon(IconlyBroken.notification),
                ),
              ),
            )
          ],
        ),
        body: pageList[pageIndex],
        bottomNavigationBar: SalomonBottomBar(
            itemPadding: const EdgeInsets.all(15),
            currentIndex: pageIndex,
            onTap: (p0) {
              setState(() {
                pageIndex = p0;
              });
            },
            items: [
              SalomonBottomBarItem(
                icon: const Icon(IconlyLight.home),
                title: const Text('Home'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(IconlyLight.call),
                title: const Text('Services'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(IconlyLight.buy),
                title: const Text('Cart'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(IconlyLight.profile),
                title: const Text('Profile'),
              ),
            ]));
  }
}
