import 'package:assesment/const/const.dart';
import 'package:assesment/const/custom_button.dart';
import 'package:assesment/const/custom_textfield.dart';
import 'package:assesment/firebase/auth.dart';
import 'package:assesment/pages/homepage.dart';
import 'package:assesment/pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void dispose() {
    _emailController.clear();
    _passwordController.clear();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          'Sign In',
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
              SizedBox(height: 16.0),
              CustomButton(
                text: 'Sign In',
                onPressed: _signIn,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: myStyle(14, hintcolor),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
                        },
                        child: Text(
                          'Sign Up',
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
  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      print('User is Succesfully Signed In');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(),
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
