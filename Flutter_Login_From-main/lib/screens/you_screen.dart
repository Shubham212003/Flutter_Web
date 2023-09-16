//import 'package:amazon_clone/widgets/Top_button.dart';
import 'package:amazon_clone/widgets/You_Orders.dart';
import 'package:amazon_clone/widgets/You_Top_botton.dart';
import 'package:amazon_clone/widgets/you_below_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/your_Drawer.dart';

class You_Screen extends StatelessWidget {
  const You_Screen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // Increase the height to accommodate the profile picture and name
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 150,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15,
                      ),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              ),
            ],
          ),
          flexibleSpace: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BelowAppBar(), // Include your BelowAppBar widget here
            ],
          ),
        ),
      ),
      body: const Column(
  children: [
    SizedBox(height: 10), // Add a comma here
    TopBotton(),
    SizedBox(height: 10),
    Orders(),
    // Rest of your content goes here
  ],
),
drawer: YourDrawerWidget(),
  );
  }
}
