import 'package:flutter/material.dart';

class AppBarWithoutSearch extends StatelessWidget {
  const AppBarWithoutSearch({
    Key key,
    this.autoImplyLeading,
  }) : super(key: key);

  final bool autoImplyLeading;

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
                text: 'NUS',
                style: TextStyle(
                  color: Colors.orange[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1.5,
                ),
              ),
              TextSpan(
                text: 'ocial',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1.5,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
