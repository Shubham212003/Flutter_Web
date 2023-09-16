import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key});

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
      // Stream to listen for changes in the user's document in Firestore
      stream: FirebaseFirestore.instance.collection('users').doc(user?.uid).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(); // Show a loading indicator while data is loading
        }

        var userData = snapshot.data?.data() as Map<String, dynamic>?;

        // Extract the user's name
        final userName = user?.displayName ?? "User";

        // Extract the user's address
        final userAddress = userData?['address'] ?? "N/A";

        return Container(
          height: 50,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 144, 226, 221),
                Color.fromARGB(255, 162, 236, 233),
              ],
              stops: [0.5, 1.0],
            ),
          ),
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery to $userName',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Address: $userAddress',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  top: 2,
                ),
                child: Icon(Icons.arrow_drop_down_outlined, size: 18,),
              )
            ],
          ),
        );
      },
    );
  }
}
