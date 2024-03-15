import 'package:flutter/material.dart';
import 'package:food/consent/colors.dart';

PreferredSizeWidget appbar(){
  return AppBar(
    elevation: 0,
    title: Icon(
      Icons.menu,
      size: 27,
    ),
    actions: [
      CircleAvatar(
        radius: 18,
        backgroundImage: AssetImage('image/user.jpg'),
      )
    ],
    backgroundColor: maincolor,
  );
}