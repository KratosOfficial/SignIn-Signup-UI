
import 'package:flutter/material.dart';

import '../../theme.dart';

class EmailScreen extends StatefulWidget {
  final VoidCallback? callback;

  const EmailScreen({Key? key, this.callback}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {

  FocusNode myFocusNode = new FocusNode();

  // This function is triggered when the clear buttion is pressed
  void _clearTextField() {
    // Clear everything in the text field
    _emailController.clear();
    // Call setState to update the UI
    setState(() {});
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _obscureText = true;

  var email = "";
  var password = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  userLogin() async {

  }

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formkey,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [

              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: AppColors.lightBlack),
                  hintText: "Enter your Email",
                  suffixIcon:IconButton(
                    icon: ImageIcon(
                      AssetImage("assets/icons/ic_CloseSquare.png"),
                      color: AppColors.lightBlack,
                    ),
                    onPressed: _clearTextField,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.lightBlack),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.lightBlack),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),

              //password

              TextFormField(
                obscureText: _obscureText,
                controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                    child: Icon(_obscureText ? Icons.visibility : Icons
                        .visibility_off),),
                  labelText: "Password",
                  labelStyle: TextStyle(color: AppColors.lightBlack),
                  hintText: "Enter your password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  if (value.trim().length < 6) {
                    return 'Password must be at least 6 characters in length';
                  }
                  // Return null if the entered password is valid
                  return null;
                },
              ),

              //FORGET PASSWORD
              Padding(
                padding: const EdgeInsets.only(right: 0, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text("Forget Password?",
                        style: TextStyle(color: AppColors.lightBlack,
                            fontFamily: 'Open sans'),),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),


              //sign in

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: GestureDetector(
                  onTap: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        email = _emailController.text;
                        password = _passwordController.text;
                      });
                      userLogin();
                    }
                  },
                  child: Container(
                    width: 500,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: AppColors.lightBlack,
                        borderRadius: BorderRadius.circular(18)),
                    child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontFamily: 'Open sans',
                              color: AppColors.white),
                        )),
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
