import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../resources/cloudfirebase_methods.dart';
//import 'package:your_app/cloud_firestore_class.dart'; // Import your CloudFirestoreClass

class YourDrawerWidget extends StatelessWidget {
  void selectImage(){
    
  }
  final CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();

  @override
  Widget build(BuildContext context) {
    // Get the current user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Container(
        color: Colors.pink,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            FutureBuilder<String?>(
              future: cloudFirestoreClass.getUserName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching the name.
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final userName = snapshot.data ?? 'User Name';
return UserAccountsDrawerHeader(
  accountName: Text(userName),
  accountEmail: Text(user?.email ?? 'user@example.com'),
  currentAccountPicture: CircleAvatar(
    backgroundImage: NetworkImage(user?.photoURL ??
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdaJnx58xIBFsp4Q7bNhWV__MveLjkLwa0pkYJYVUE2w&s'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: selectImage,
          icon: Icon(
            Icons.add_a_photo,
            color: Colors.white, // Adjust the icon color as needed
          ),
        ),
        // You can add other widgets here if needed
      ],
    ),
  ),
  // Other properties and widgets...
);



                }
              },
            ),
            // Add other drawer items or menu options here
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle the settings action
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                // Navigate to the login or home screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
