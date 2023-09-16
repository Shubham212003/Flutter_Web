import 'package:amazon_clone/layout/screen_layout.dart';
import 'package:amazon_clone/screens/home_screen.dart';
import 'package:amazon_clone/screens/screens.dart';
import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){    await Firebase.initializeApp(options: const FirebaseOptions( 
       apiKey: "AIzaSyB0lRUuOFe861JIN4AOgZvM7eE8NlhQk4g",
  authDomain: "clone-a82da.firebaseapp.com",
  projectId: "clone-a82da",
  storageBucket: "clone-a82da.appspot.com",
  messagingSenderId: "825157484033",
  appId: "1:825157484033:web:6ae095c9e34a415f99ca00",));
  }else{
 await Firebase.initializeApp();
  }
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      
      home: StreamBuilder(
        stream:FirebaseAuth.instance.authStateChanges(),
         builder:
          (context,AsyncSnapshot<User?> user){
         if(user.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator( 
              color: Colors.orange,
              ),
              );

         }else if(user.hasData){
        //    print("uid- ${FirebaseAuth.instance.currentUser!.uid}");
        
        //  return ElevatedButton(onPressed: (){
        //   FirebaseAuth.instance.signOut();
        //  }, child: Text("Sign Out"),);


   //return const ScreenLayout();
   return const ScreenLayout();
  

         }else{
          
          return const SignInScreen();
         }
      }),
      );
    
    
  }
}

