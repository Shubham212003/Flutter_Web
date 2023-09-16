import 'package:amazon_clone/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/screens/you_screen.dart';
import 'package:amazon_clone/screens/home_screen.dart';
import 'package:amazon_clone/screens/cart_screen.dart';
import 'package:amazon_clone/screens/more_screen.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  int currentindex = 0;
  final List<Widget> screens = [
   const Home_Screen(),
   const You_Screen(),
   
    const More_Screen(),
     const Cart_Screen(),
    const Menu_Screen(),
  ];
  final List<String> screenTitles = ['Home', 'You', 'More', 'Cart', 'Menu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.black,
        iconSize: 30,
        currentIndex: currentindex,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(Icons.person),
            label: 'You',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(Icons.model_training_rounded),
            label: 'More',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.purple,
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
           BottomNavigationBarItem(
            backgroundColor: Colors.purple,
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          
        ],
      ),
      body: screens[currentindex],
    );
  }
}
