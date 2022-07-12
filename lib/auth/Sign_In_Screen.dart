import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialv/auth/Compounds/Email_Signup.dart';
import 'package:prokit_socialv/auth/Compounds/phone_SignUp.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int selectedIndex = 0;
  bool isPhoneEnabled = true;

  Widget getFragment() {
    if (selectedIndex == 0)
      return EmailScreen(
        callback: () {
          selectedIndex = 1;
          setState(() {});
        },
      );
    else
      return PhoneSignup(
        callback: () {
          selectedIndex = 0;
          setState(() {});
        },
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(0),
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xffEDEFFE),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          selectedIndex = 0;
                          setState(() {});
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: selectedIndex == 0
                          ? Colors.blueAccent
                            : Color(0xffEDEFFE),
                            borderRadius: BorderRadius.circular(18),
                          ),

                            child: Center(
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  color: selectedIndex == 0
                                      ? Colors.white
                                      : Colors.blueAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          selectedIndex = 1;
                          setState(() {});
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: selectedIndex == 1
                                ? Colors.blueAccent
                                : Color(0xffEDEFFE),
                            borderRadius: BorderRadius.circular(18),
                          ),
                            child: Center(
                              child: Text(

                                "Phone",
                                style: TextStyle(
                                  color: selectedIndex == 0
                                      ? Colors.blueAccent
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              getFragment().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
