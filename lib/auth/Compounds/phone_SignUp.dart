import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prokit_socialv/auth/Sign_In_Screen.dart';

import '../../theme.dart';


class PhoneSignup extends StatefulWidget {
  final VoidCallback? callback;

  const PhoneSignup({Key? key, this.callback}) : super(key: key);

  @override
  State<PhoneSignup> createState() => _PhoneSignupState();
}

class _PhoneSignupState extends State<PhoneSignup> {

  final _formKey = GlobalKey<FormState>();

  void _clearTextField() {
    phonecontroller.clear();
    setState(() {});
  }
  var phone = "";
  String dialCodeDigits ="+00";
  final phonecontroller = TextEditingController();


  @override
  void dispose() {
    phonecontroller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 400,
                  height: 60,
                  child: CountryCodePicker(
                    onChanged: (country){
                      setState((){
                        dialCodeDigits =country.dialCode!;
                      });
                    },
                    initialSelection: "IN",
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    favorite: ["+91","IN", "+1","US", "+92","PAK"],
                  ),
                ),

                TextFormField(
                  controller: phonecontroller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(color: AppColors.lightBlack),
                    hintText: "Enter your Phone Number",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 15),
                      child: Text( dialCodeDigits  , style: TextStyle(color: AppColors.lightBlack, fontWeight: FontWeight.bold),),
                    ),
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
                      return 'Please enter your phone Number';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                ),

                SizedBox(height: 30,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: GestureDetector(
                    onTap: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          phone = phonecontroller.text;
                        });
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) =>
                            SignUpScreen(
                            )));
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
                            "Continue",
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
      ),
    );
  }
}
