import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nusocial/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String password = '';
  String error = '';
  String major = '';
  int year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Center(
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Register to NUSocial',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Username",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              validator: (val) =>
                                  val.isEmpty ? "Enter your username" : val.contains(" ") ? "Spaces are not allowed" : null,
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
                                  borderRadius: BorderRadius.circular(15),
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
                            Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                alignment: Alignment.centerLeft,
                                child: Text("Year")),
                            SizedBox(height: 5.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: DropdownButton(
                                value: year,
                                icon: Icon(Icons.arrow_downward),
                                items: <int>[
                                  1,2,3,4
                                ].map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                onChanged: (int newValue) {
                                  setState(() {
                                    year = newValue;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Major",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              validator: (val) =>
                                  val.isEmpty ? "Enter your major" : null,
                              onChanged: (val) {
                                major = val;
                              },
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              child: Text("Register"),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          name,
                                          year,
                                          major,
                                          password);
                                  if (result == null) {
                                    setState(() {
                                      error = "Username is alrady taken";
                                    });
                                  }
                                } else {
                                  setState(() {
                                    error = 'Register Failed.';
                                  });
                                }
                              },
                            ),
                          ],
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
                                text: "Already have an account? ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: 'Sign in',
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    widget.toggleView();
                                  })
                          ])),
                          SizedBox(height: 12.0),
                          Text(error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0))
                        ],
                      ),
                    ),
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
