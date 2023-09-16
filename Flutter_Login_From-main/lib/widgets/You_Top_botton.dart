
import 'package:amazon_clone/widgets/You_Screen_botton.dart';

import 'package:flutter/material.dart';

class TopBotton extends StatefulWidget {
  const TopBotton({Key? key}): super(key: key);

  @override
  State<TopBotton> createState() => _TopBoyyonsState();
}

class _TopBoyyonsState extends State<TopBotton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HomeButton(
              text: 'Your Orders',
              onTap: () {
                // Add your logic for the "Your Orders" button here
               
                // You can add more logic here if needed
              },
            ),
             HomeButton(
              text: 'Turn Seller',
              onTap: () {
                // Add your logic for the "Your Orders" button here
               
                // You can add more logic here if needed
              },
            ),
            
          ],
        ),
        const SizedBox(height: 5,),
          Row(
          children: [
            HomeButton(
              text: 'Log Out',
              onTap: () {
                // Add your logic for the "Your Orders" button here
               
                // You can add more logic here if needed
              },
            ),
             HomeButton(
              text: 'Your Wish List',
             
              onTap: () {
                // Add your logic for the "Your Orders" button here
               
                // You can add more logic here if needed
              },
            ),
            
          ],
        ),
      ],
    );
  }
}