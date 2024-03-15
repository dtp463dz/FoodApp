import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/consent/appBar.dart';
import 'package:food/consent/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexx = 0;
  List category = ['All', 'Lunch', 'Dinner', 'Breackfast'];
  List categoryname = ['dinner', 'lunch', 'dinner', 'fast'];
  List food = [
    ['burger', 'omlet', 'grilled wings', 'Grilled ribs'],
    ['pizza', 'steak', 'pasta', 'burger'],
    ['burger', 'omlet', 'grilled wings', 'Grilled ribs'],
    ['pancake', 'egg', 'banana', 'egg'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: appbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                'Popular Catehory',
                style: TextStyle(
                  fontSize: 20,
                  color: font,
                  fontFamily: 'ro',
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: ListView.builder(
                        itemCount: 4,   // so item
                        scrollDirection: Axis.horizontal, //chieu ngang
                        itemBuilder: ((context, index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              indexx = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(20),
                              color: indexx == index    // click để hiển thị
                                  ? maincolor
                                  : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: indexx == index
                                      ? maincolor
                                      : Colors.transparent,
                                  offset: indexx == index
                                      ? Offset(1, 1)
                                      : Offset(0, 0),
                                  blurRadius: indexx == index ? 10 : 0,
                                )
                              ]
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 17),
                                child: Text(
                                  category[index],      //hien thi list category
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: indexx == index    // click để hiển thị
                                        ? Colors.white
                                        : font,
                                    fontFamily: 'ro',
                                  ),
                                ),
                              ),
                            )
                          ),
                        ),
                      );
                    })),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 20,
                          color: font,
                          fontFamily: 'ro',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index){
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 185, 185, 185),
                                  offset: Offset(1, 1),
                                  blurRadius: 15,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(right: 14),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [Icon(Icons.favorite_border)],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15,
                                  ),
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'image/${categoryname[indexx]}${index}.jpg',        // hinh anh
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  food[indexx][index],      // ten
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: font,
                                    fontFamily: 'ro',
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '100 min',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontFamily: 'ro',
                                      ),
                                    ),
                                    Row(

                                      children: [
                                        Icon(Icons.star, color: maincolor, size: 15),
                                        Text(
                                          '4.2',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontFamily: 'ro',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                      },
                  childCount: 4,    // so luong ô
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 270,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
            ),
          )
        ],
      ),
    );
  }
}

