import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  AppBarDefault({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 3.0,
            offset: new Offset(0.0, 3.0),
          ),
        ]
      ),
      child: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
