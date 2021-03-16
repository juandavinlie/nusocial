import 'package:flutter/material.dart';
import 'package:nusocial/constants.dart';
import 'package:nusocial/models/academicevent.dart';
import 'package:nusocial/models/activityevent.dart';
import 'package:nusocial/models/gamingevent.dart';
import 'package:nusocial/models/hackathonevent.dart';
import 'package:nusocial/models/otherevent.dart';
import 'package:nusocial/screens/components/body.dart';
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
      appBar: CustomAppBar(),
      endDrawer: CustomDrawer(),
      body: Body(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[50],
      child: Column(
        children: [
          AppBarWithoutSearch(autoImplyLeading: false,),
          HeaderWithSearchBox(size: size),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + kExtendAppBarHeight);
}


