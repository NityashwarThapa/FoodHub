import 'package:flutter/material.dart';
import 'package:food_hub/view/bottom_view/cart.dart';
import 'package:food_hub/view/bottom_view/home.dart';
import 'package:food_hub/view/bottom_view/profile.dart';
import 'package:food_hub/view/bottom_view/search.dart';

class DashboardPageView extends StatefulWidget {
  const DashboardPageView({super.key});

  @override
  State<DashboardPageView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashboardPageView> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const Home(),
    const Search(),
    const Cart(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent[100],
      ),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // yo garyo vane matra 4 5 ota icon rakhna pauxa na vaye 3 ta matrapauxa

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
