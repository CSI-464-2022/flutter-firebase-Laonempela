import 'package:flutter/material.dart';

import '../screens/profile_page.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('CovidSafe'),
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          iconSize: 28.0,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProfilePage(),),);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


