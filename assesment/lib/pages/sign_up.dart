import 'package:assesment/const/const.dart';
import 'package:assesment/const/custom_button.dart';
import 'package:assesment/const/custom_textfield.dart';
import 'package:assesment/firebase/auth.dart';
import 'package:assesment/pages/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    IconButton myIconButton = IconButton(
      icon: Icon(
        Icons.visibility_off_outlined,
        size: 18,
        color: hintcolor,
      ),
      onPressed: () {
        // Define onPressed function
        // Add your logic here
        print('IconButton pressed!');
      },
    );
    return SafeArea(
        child: Scaffold(
      backgroundColor: ScaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 30,
            color: Color(0xff23213D),
          ),
        ),
        title: Text(
          'Sign Up',
          style: myStyle(22, Color(0xff1F7F8B)),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create account and enjoy all services',
                style: myStyle(16, headline),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                prefixicon: Icon(
                  Icons.person_outline_rounded,
                  color: iconcolor,
                  size: 20,
                ),
                labelText: 'Full Name',
                hintText: 'Enter your Full Name',
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                prefixicon: Icon(
                  Icons.email_outlined,
                  color: iconcolor,
                  size: 20,
                ),
                labelText: 'Email',
                hintText: 'Enter your email',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                suffixicon: myIconButton,
                prefixicon: Icon(
                  Icons.lock_outline_rounded,
                  color: iconcolor,
                  size: 20,
                ),
                labelText: 'Password',
                hintText: 'Enter your Password',
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                suffixicon: myIconButton,
                prefixicon: Icon(
                  Icons.lock_outline_rounded,
                  color: iconcolor,
                  size: 20,
                ),
                labelText: 'Confirm Password',
                hintText: 'Enter your Confirm Password',
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Confirm Password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              CustomButton(text: 'Sign Up', onPressed: _signUp),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ?',
                      style: myStyle(14, hintcolor),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign In',
                          style: myStyle(14, Colors.blue),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void _signUp() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmpassword = _confirmPasswordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      print('User is Succesfully Created');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SignIn(),
      ));
    } else {
      {
        Fluttertoast.showToast(
          msg: 'User not found. Please sign up first.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
      print('Some Error Happend');
    }
  }
}
