import 'package:flutter/material.dart';

class AppBarWithoutSearch extends StatelessWidget {
  const AppBarWithoutSearch({
    Key key,
    this.autoImplyLeading,
    this.text1,
    this.text2,
  }) : super(key: key);

  final bool autoImplyLeading;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: autoImplyLeading,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.fromLTRB(5, 7, 0, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: text1,
                style: TextStyle(
                  color: Colors.orange[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1,
                ),
              ),
              TextSpan(
                text: text2,
                style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
