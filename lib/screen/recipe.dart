import 'package:flutter/material.dart';
import 'package:food/screen/home.dart';

import '../consent/colors.dart';

class Recipe extends StatelessWidget {
  Recipe({super.key});
  List icon = ['dough-rolling', 'cheese', 'meat', 'sausage'];
  List value = ['250g', '120g', '100g', '50g'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,     // tắt back defaut
              backgroundColor: Colors.white,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'image/lunch1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(10),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Container(        // thanh gạt ngang
                        width: 80,
                        height: 4,
                        color: font,
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(       // tym
                    backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
                    radius: 18,
                    child: Icon(
                      Icons.favorite_border,
                      size: 25,
                      color: font,
                    ),
                  ),
                ),
              ],
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(       // back home
                  backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
                  radius: 18,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Home();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: font,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _getbody(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getbody(){
    return Wrap(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 33,
                    height: 33,
                    child: Image.asset('image/flash.png'),
                  ),
                  Container(
                    width: 33,
                    height: 33,
                    child: Image.asset('image/meat.png'),
                  ),
                  Container(
                    width: 33,
                    height: 33,
                    child: Image.asset('image/calories.png'),
                  ),
                  Container(
                    width: 33,
                    height: 33,
                    child: Image.asset('image/star.png'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '120',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontFamily: 'ro'
                    ),
                  ),
                  Text(
                    '150',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: 'ro'
                    ),
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: 'ro'
                    ),
                  ),
                  Text(
                    '4.4',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: 'ro'
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      'Ingredients',
                      style: TextStyle(
                          fontSize: 20,
                          color: font,
                          fontFamily: 'ro'
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ...List.generate(
                          4,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7),
                                child: Container(      // cheese hàm lượng
                                  width: 90,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(1, 1),
                                        color: Colors.grey,
                                        blurRadius: 7,
                                      )
                                    ]
                                  ),
                                  child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset('image/${icon[index]}.png'),
                                      Text(
                                        value[index],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: font,
                                            fontFamily: 'ro'
                                        ),
                                      ),
                                    ],
                                  ),
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      'Recipe',
                      style: TextStyle(
                          fontSize: 20,
                          color: font,
                          fontFamily: 'ro'
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Nội dung',
                  style: TextStyle(
                    fontSize: 18,
                    color: font,
                    fontFamily: 'ro',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
