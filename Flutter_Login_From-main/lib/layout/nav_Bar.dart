// import 'package:flutter/material.dart';

// class NavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text('Oflutter.com'),
//             accountEmail: const Text('example@gmail.com'),
//             currentAccountPicture: CircleAvatar(
//               child: ClipOval(
//                 child: Image.network(
//                   'https://media.licdn.com/dms/image/D4D03AQE7sV3-lI9xgA/profile-displayphoto-shrink_800_800/0/1674899928433?e=2147483647&v=beta&t=q8zjiuAyLpUgV2fJM_CE6Vltr5vQgjl56KlPxpY-3KU',
//                   fit: BoxFit.cover,
//                   width: 90,
//                   height: 90,
//                 ),
//               ),
//             ),
//             decoration: const BoxDecoration(
//               color: Colors.blue,
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: NetworkImage('https://images.unsplash.com/photo-1614624532983-4ce03382d63d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8ZGVza3RvcCUyMGNvbXB1dGVyfGVufDB8fDB8fHww&w=1000&q=80'),
//               ),
//             ),
//           ),
//           ListTile(
//             title: const Text('Home'),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer
//               Navigator.pushReplacementNamed(context, '/home');
//             },
//           ),
//           ListTile(
//             title: const Text('Account'),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer
//               Navigator.pushReplacementNamed(context, '/account');
//             },
//           ),
//           ListTile(
//             title: const Text('Settings'),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer
//               Navigator.pushReplacementNamed(context, '/settings');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
