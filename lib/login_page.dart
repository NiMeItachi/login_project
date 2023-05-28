import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  static const String id = "login_page";

  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _obscureText = true;
  String? errorText;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(15, 15, 15, 100),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80),
            //Logo
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/images/logo.png"),
            ),

            // Switch: Log in & Register
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 28),
                height: 48,
                width: 220,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(49, 49, 52, 100),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 95,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(56, 56, 60, 100),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Log in",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 95,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(56, 56, 60, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Color.fromRGBO(87, 87, 88, 100),
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            //Input
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // "Email address"
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email address",
                      style: TextStyle(
                          color: Color.fromRGBO(87, 87, 88, 100), fontSize: 16),
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(56, 56, 60, 100),
                      hintText: "you@example.com",
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(87, 87, 88, 100), fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(87, 87, 88, 0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(56, 56, 60, 0),
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    autofocus: false,
                  ),

                  const SizedBox(height: 25),

                  // "Password"
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: Color.fromRGBO(87, 87, 88, 100), fontSize: 16),
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      errorText: errorText,
                      constraints: const BoxConstraints(
                        minHeight: 80,
                        maxHeight: 100,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(56, 56, 60, 100),
                      suffixIcon: SizedBox(
                        width: 100,
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                passwordController.text = "";
                                setState(() {});
                              },
                              child: Icon(
                                passwordController.text.isNotEmpty ? Icons.close : null,

                                color: Colors.grey,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _obscureText = !_obscureText;
                                setState(() {});
                              },
                              child: Icon(
                                _obscureText
                                    ? CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash_fill,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      hintText: "Your password",
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(87, 87, 88, 100), fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(87, 87, 88, 0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(56, 56, 60, 0),
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    autofocus: false,
                    obscureText: _obscureText,
                    onChanged: (message) {
                      if (message.length < 4) {
                        errorText = "Not enough characters in password";
                      } else {
                        errorText = null;
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            //Log In
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(115, 57, 229, 100),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            //Forgot password
            const Text(
              "Forgot password?",
              style: TextStyle(
                color: Color.fromRGBO(115, 57, 229, 100),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 125),
            //Sign in with
            Text(
              "Sign in with",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 15),
            //Sign in with
            SizedBox(
              height: 45,
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Apple
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      "assets/images/apple.png",
                      color: Colors.grey,
                      scale: 0.9,
                    ),
                  ),
                  //Facebook
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      "assets/images/facebook.png",
                      color: Colors.grey,
                      scale: 0.9,
                    ),
                  ),
                  //Twitter
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      "assets/images/twitter.png",
                      color: Colors.grey,
                      scale: 0.9,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
