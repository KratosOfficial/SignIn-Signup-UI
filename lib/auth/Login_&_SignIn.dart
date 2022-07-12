import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prokit_socialv/auth/Sign_In_Screen.dart';

class LoginSignIn extends StatefulWidget {
  const LoginSignIn({Key? key}) : super(key: key);

  @override
  State<LoginSignIn> createState() => _LoginSignInState();
}

class _LoginSignInState extends State<LoginSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
              ),
              Text(
                "Welcome \nback!",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Image(
                    image: AssetImage("assets/icons/ic_Facebook.png"),
                    height: 30,
                  ),
                  title: Text("Continue With Facebook"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Image(
                    image: AssetImage("assets/icons/ic_Google.png"),
                    height: 30,
                  ),
                  title: Text("Continue With Google"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Container(
                  padding: EdgeInsets.all(0.5),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                          color: Colors.black, ),
                      children: <TextSpan>[
                        TextSpan(text: ' Sign up',
                            style: TextStyle(
                                color: Colors.blueAccent,),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              }
                        )
                      ]
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  color: Color(0xFFE5EDFF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      "Register Later",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
