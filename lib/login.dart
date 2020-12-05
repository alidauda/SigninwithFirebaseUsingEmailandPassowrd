import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:ui_loyd/signin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _emailTextController = TextEditingController();
    final _passwordController = TextEditingController();

    void _signInWithEmailAndPassword() async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordController.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print(e);
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context)
              .unfocus(), ////this allow you to untoggle the keyboard if you tap outside the screen
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white70),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ///Niche App Logo goes in here

                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                // BoxShadow(
                                //   color: Colors.black12,
                                //   blurRadius: 6.0,
                                //   offset: Offset(0, 2),
                                // ),
                              ],
                            ),
                            height: 60.0,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTextController,
                              style: TextStyle(
                                //color: Colors.white,
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                // border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xFF6CA8F1),
                                ),
                                hintText: 'Enter your Email',
                                hintStyle: TextStyle(
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Password',
                            style: TextStyle(
                              //color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              // color: Color(0xFF6CA8F1),
                              borderRadius: BorderRadius.circular(10.0),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black12,
                              //     blurRadius: 6.0,
                              //     offset: Offset(0, 2),
                              //   ),
                              // ],
                            ),
                            height: 60.0,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              style: TextStyle(
                                //  color: Colors.white,
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                // border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(0xFF6CA8F1),
                                ),
                                hintText: 'Enter your Password',
                                hintStyle: TextStyle(
                                  //color: Colors.white54,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // alignment: Alignment.centerRight, you can uncomment this if you want the text to move to the right of the screen
                        child: FlatButton(
                          onPressed: () =>
                              print('Forgot Password Button Pressed'),
                          //padding: EdgeInsets.only(right: 0.0), and
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              //color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: _signInWithEmailAndPassword,
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Color(0xFF6CA8F1),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Signin()))
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don\'t have an Account? ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
