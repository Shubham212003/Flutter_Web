import 'package:amazon_clone/resources/cloudfirebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/model/user_details_model.dart';
//import 'cloud_firestore_class.dart'; // Import your CloudFirestoreClass

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // Specify your decoration properties
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: FutureBuilder<User?>(
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading indicator while fetching the user
          }

          if (snapshot.hasData && snapshot.data != null) {
            final user = snapshot.data!;
            final cloudFirestoreClass = CloudFirestoreClass();

            return FutureBuilder<String?>(
              future: cloudFirestoreClass.getUserName(),
              builder: (context, nameSnapshot) {
                if (nameSnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching the user's name
                }

                final userName = nameSnapshot.data ?? user.displayName;

                return RichText(
                  text: TextSpan(
                    text: 'Hello, ',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: userName,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                             fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Text(
              'Hello, Guest', // Show a default message if the user is not authenticated
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
             
              ),
            );
          }
        },
      ),
    );
  }
}
