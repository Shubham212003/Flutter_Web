import 'package:amazon_clone/model/user_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> uploadNameAndAddressToDatabase(
      {required UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }

  Future<String?> getUserName() async {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser != null) {
      final userDoc = await firebaseFirestore.collection("users").doc(currentUser.uid).get();
      if (userDoc.exists) {
        final userData = userDoc.data() as Map<String, dynamic>;
        return userData["name"] as String?;
      }

    }
    return null; // Return null if the user is not authenticated or the document doesn't exist.
  }
  Future<String?> getPassword() async {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser != null) {
      final userDoc = await firebaseFirestore.collection("users").doc(currentUser.uid).get();
      if (userDoc.exists) {
        final userData = userDoc.data() as Map<String, dynamic>;
        return userData["Password"] as String?;
      }
      
    }
    return null; // Return null if the user is not authenticated or the document doesn't exist.
  }
}
