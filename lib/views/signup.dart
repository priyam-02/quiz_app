import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/views/background.dart';
import 'package:quiz_app/views/signin.dart';
import 'package:quiz_app/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const SignUp({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String email = '';
  String name = '';
  String password = '';

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Stack(children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: appBar(context),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: isLoading
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.yellow.shade900,
                        ),
                      ),
                    )
                  : Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Container(child: buildLogo()),
                            SizedBox(
                              height: 50,
                            ),

                            //Name field
                            TextFormField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Enter Name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black54),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 18.0),
                                prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.yellow.shade900,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.yellow.shade900),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.yellow.shade900),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                              ),
                              onChanged: (val) {
                                name = (val);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //Email Address field
                            TextFormField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Enter a valid Email address'
                                  : null,
                              decoration: InputDecoration(
                                hintText: "Email Address",
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black54),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 18.0),
                                prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Icon(
                                      Icons.mail,
                                      color: Colors.yellow.shade900,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.yellow.shade900),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.yellow.shade900),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                              ),
                              onChanged: (val) {
                                email = (val);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //Password field
                            TextFormField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              controller: passController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              obscuringCharacter: "*",
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) =>
                                  password != null && password.length < 6
                                      ? "Enter minimum 6 characters"
                                      : null,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black54),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 18.0),
                                prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.yellow.shade900,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.yellow.shade900),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.yellow.shade900),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                              ),
                              onChanged: (val) {
                                password = (val);
                              },
                            ),

                            SizedBox(
                              height: 24,
                            ),

                            //Sign Up Button
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.yellow.shade900,
                                    elevation: 10,
                                    fixedSize: const Size(250, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () {
                                  signUp();
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),

                            SizedBox(
                              height: 30,
                            ),

                            //Already have an account?
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.5,
                                              color: Colors.black),
                                          text: "Already have an account? ",
                                          children: [
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = widget.onClickedSignIn,
                                            text: "Sign In",
                                            style: TextStyle(
                                                fontSize: 20,
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.yellow.shade900,
                                                fontWeight: FontWeight.bold))
                                      ])
                                      // (style: TextStyle(fontSize: 15.5)
                                      //   text: "Don't have an account? ",
                                      //   ),

                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => SignUp()));

                                      ),
                                ]),

                            SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ]);
    });
  }

  Future signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
