import 'package:flutter/material.dart';
import 'package:nusocial/constants.dart';
import 'package:nusocial/models/academicevent.dart';
import 'package:nusocial/models/activityevent.dart';
import 'package:nusocial/models/gamingevent.dart';
import 'package:nusocial/models/hackathonevent.dart';
import 'package:nusocial/models/localuser.dart';
import 'package:nusocial/models/otherevent.dart';
import 'package:nusocial/models/user.dart';
import 'package:nusocial/screens/components/body.dart';
import 'package:nusocial/services/database.dart';
import 'package:provider/provider.dart';
import 'components/appbar_without_search.dart';
import 'components/custom_drawer.dart';
import 'components/header_with_searchbox.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          autoImplyLeading: false,
          text1: 'NUS',
          text2: 'ocial',
        ),
        endDrawer: CustomDrawer(),
        body: Body());
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool autoImplyLeading;
  final String text1;
  final String text2;

  const CustomAppBar({
    Key key,
    this.autoImplyLeading,
    this.text1,
    this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[50],
      child: Column(
        children: [
          AppBarWithoutSearch(
              autoImplyLeading: autoImplyLeading, text1: text1, text2: text2),
          HeaderWithSearchBox(size: size),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + kExtendAppBarHeight);
}
