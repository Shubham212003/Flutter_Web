import 'package:amazon_clone/layout/screen_layout.dart';
import 'package:amazon_clone/resources/authentication_methods.dart';
import 'package:amazon_clone/screens/sign_up_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenaticationMethods authenaticationMethods = AuthenaticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
      ),
   body: Container(
     width: double.infinity,
     decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
      colors: [
        Colors.blue,
        const Color.fromRGBO(15, 100, 100, 1),
        Colors.blue,
        Colors.blue,
      ]
      )
     ),
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/image.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      amazonLogo,
                      height: screenSize.height * 0.10,
                    ),
                  Container(
                    height: screenSize.height * 0.6,
                    width: screenSize.width * 0.8,
                   
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign-In",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 33,color: Colors.black),
                        ),
                        TextFieldWidget(
                          title: "Email",
                          controller: emailController,
                          obscureText: false,
                          hintText: "Enter your email",
                        ),
                        TextFieldWidget(
                          title: "Password",
                          controller: passwordController,
                          obscureText: true,
                          hintText: "Enter your password",
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomMainButton(
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    letterSpacing: 0.6,
                                     color: Colors.black),
                              ),
                              color: yellowColor,
                              isLoading: isLoading,
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                  Future.delayed(Duration(seconds: 1));
                                String output =
                                    await authenaticationMethods.signInUser(
                                        email: emailController.text,
                                        password: passwordController.text);
                                setState(() {
                                  isLoading = false;
                                });
                                // error
                                if (output == "success") {
                                  //functions
                                } else {
                                  //error
                                  Utils().showSnackBar(
                                      context: context, content: output);
                                }
                              }),
                        )
                      ],
                    ),
                    
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "New to Shopping?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      
                    ],
                  ),
                  CustomMainButton(
                      child: const Text(
                        "Create an Shopping Account",
                        style: TextStyle(
                          letterSpacing: 0.6,
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.grey[400]!,
                      isLoading: false,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpScreen();
                        }));
                      }
                      ),
                      
         CustomMainButton(
  color: Colors.white,
  isLoading: false,
  onPressed: () {
    GoogleSignIn().signIn();
    // Handle sign in with Google here
  },
  child: InkWell(
    onTap: () {
      // Add your Google Sign-In logic here
      GoogleSignIn().signIn();
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/google.png',
          height: 28,
          width: 28,
        ),
        const SizedBox(width: 8),
        const Text(
          "Sign in with Google",
          style: TextStyle(
            letterSpacing: 0.6,
            color: Colors.black,
          ),
        ),
      ],
    ),
  ),
),
                  CustomMainButton(
                    color: Colors.white,
                    isLoading: false,
                    onPressed: () {
                    
                      // Handle sign in with Google here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/facebook.png',
                          height: 28,
                          width: 28,
                        ),
                        const SizedBox(width: 8), // Add spacing between icon and text
                        const Text(
                          "Sign in with Google",
                          style: TextStyle(
                            letterSpacing: 0.6,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),


                  
                ],
              ),
            ),
          ),
        ),
      ),
      ),
      drawer: Drawer(),
    );
  }
}
// void main() {
//   runApp(MaterialApp(
//     home: ScreenLayout(),
//   ));
// }