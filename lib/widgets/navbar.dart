import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../screens/home_screen.dart';
import '../screens/order_screen.dart';
import '../screens/status_screen.dart';
import '../screens/summary_screen.dart';
import '../screens/profile_screen.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryOrange = Color(0xFFFF5A26);

    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home, size: 28),
            title: "Beranda",
            activeForegroundColor: primaryOrange,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const StatusScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.access_time, size: 28),
            title: "Status",
            activeForegroundColor: primaryOrange,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const OrderScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.add, size: 36, color: Colors.white),
            title: "Order",
            activeForegroundColor: primaryOrange,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const SummaryScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.receipt_long, size: 28),
            title: "Ringkasan",
            activeForegroundColor: primaryOrange,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const ProfileScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.person, size: 28),
            title: "Profil",
            activeForegroundColor: primaryOrange,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
      ],
      animatedTabBuilder: (context, index, animationValue, newIndex, oldIndex, child) {
        return child;
      },
      navBarBuilder: (navBarConfig) =>
          _CustomNavBar(navBarConfig: navBarConfig),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({required this.navBarConfig});

  final NavBarConfig navBarConfig;

  Widget _buildItem(ItemConfig item, bool isSelected) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconTheme(
        data: IconThemeData(
          size: item.iconSize,
          color: isSelected
              ? item.activeForegroundColor
              : item.inactiveForegroundColor,
        ),
        child: isSelected ? item.icon : item.inactiveIcon,
      ),
      if (item.title != null)
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            item.title!,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? item.activeForegroundColor
                  : item.inactiveForegroundColor,
            ),
          ),
        ),
    ],
  );

  Widget _buildMiddleItem(ItemConfig item, bool isSelected) => SizedBox(
    height: 75,
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -25,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFF5A26),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF5A26).withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: IconTheme(
                data: IconThemeData(size: item.iconSize, color: Colors.white),
                child: item.icon,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 12,
          child: Text(
            item.title ?? "",
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? item.activeForegroundColor
                  : item.inactiveForegroundColor,
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final midIndex = (navBarConfig.items.length / 2).floor();
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: navBarConfig.items.map((item) {
              final int index = navBarConfig.items.indexOf(item);
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (index == 2) {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => const OrderScreen(),
                        ),
                      );
                    } else {
                      navBarConfig.onItemSelected(index);
                    }
                  },
                  child: index == midIndex
                      ? _buildMiddleItem(
                          item,
                          navBarConfig.selectedIndex == index,
                        )
                      : _buildItem(item, navBarConfig.selectedIndex == index),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
