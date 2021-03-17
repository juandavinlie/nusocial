import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nusocial/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(kToolbarHeight),
      //   child: AppBarWithoutSearch(
      //     autoImplyLeading: false,
      //     text1: 'NUS',
      //     text2: 'ocial',
      //   ),
      // ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Center(
                        child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'NUS',
                                    style: TextStyle(
                                      color: Colors.orange[400],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'ocial',
                                    style: TextStyle(
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text(
                            //   'Sign in to NUSocial',
                            //   style: TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              validator: (val) =>
                                  val.isEmpty ? "Enter your username" : null,
                              onChanged: (val) {
                                name = val;
                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              validator: (val) => val.length < 6
                                  ? "Enter a password of at least 6 characters long"
                                  : null,
                              obscureText: true,
                              onChanged: (val) {
                                password = val;
                              },
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                              child: Text("Sign In"),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          name + "@nusocial.com", password);
                                  if (result == null) {
                                    setState(() {
                                      error = "Your account doesn't exist";
                                    });
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ))),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.4,
              height: 0,
              indent: 20,
              endIndent: 20,
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: 'Register',
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  widget.toggleView();
                                })
                        ])),
                        SizedBox(height: 12.0),
                        Text(error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
