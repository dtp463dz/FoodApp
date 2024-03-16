import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/consent/colors.dart';
import 'package:food/screen/home.dart';

import '../screen/categor.dart';
import '../screen/faverite.dart';
import '../screen/search.dart';
import '../screen/profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  int index = 0;
  List screen = [Home(), Category(), Search(), favorite(), Profil()];
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            index = 2;
          });
        },
        child: Icon(Icons.search),
        backgroundColor: maincolor,
        shape: CircleBorder(),    // circle search
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),    // tách 1 khoảng button search
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 27,
                  color: index == 0 ? maincolor: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Icon(
                  Icons.category,
                  size: 27,
                  color: index == 1 ? maincolor: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Icon(
                  Icons.favorite,
                  size: 27,
                  color: index == 3 ? maincolor: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 4;
                  });
                },
                child: Icon(
                  Icons.person,
                  size: 27,
                  color: index == 4 ? maincolor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screen[index],
    );
  }
}
