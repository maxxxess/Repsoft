import 'package:assesment/const/const.dart';
import 'package:assesment/const/customdropdown.dart';
import 'package:assesment/const/customdropdown2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Favorites Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: ScaffoldColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                CustomDropdown(),
                Container(
                  height: 38,
                  width: 42,
                  decoration: BoxDecoration(
                      color: Color(0xff1F7F8B),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                  child: Center(
                      child: Text(
                    '🔔',
                    style: myStyle(22, Colors.white),
                  )),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    height: 214,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 0.2, offset: Offset(0, 1))
                        ],
                        /*   boxShadow: [
                          BoxShadow(
                            blurRadius: 0.5,
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                          )
                        ],*/
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Breakfast',
                              style: myStyle(18, Colors.black),
                            ),
                            Text(
                              'Lunch',
                              style: myStyle(18, Colors.black),
                            ),
                            Text(
                              'Dinner',
                              style: myStyle(18, Colors.black),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Divider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CustomDropdown2(),
                                CustomDropdown2(),
                                Text(
                                  '9Am to 11Am',
                                  style: myStyle(10, Color(0xff5E6278)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CustomDropdown2(),
                                CustomDropdown2(),
                                Text(
                                  '12Pm to 2Pm',
                                  style: myStyle(10, Color(0xff5E6278)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CustomDropdown2(),
                                CustomDropdown2(),
                                Text(
                                  '8Pm to 10Am',
                                  style: myStyle(10, Color(0xff5E6278)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 10),
                              child: MaterialButton(
                                  color: Color(0xff1F7F8B),
                                  onPressed: () {},
                                  child: Text(
                                    'Update',
                                    style: myStyle(10, Colors.white),
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    ' MY PG',
                    style: myStyle(22, Color(0xff1F7F8B)),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 0.2, offset: Offset(0, 1))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: size.height * 0.13,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Container(
                              margin: EdgeInsets.all(24),
                              color: Color(0xffE7FCFF),
                              child: Image.asset(
                                'images/home.png',
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'All Rooms: 20',
                                  style: myStyle(16, Colors.black),
                                ),
                                Text(
                                  'All floors: 04',
                                  style: myStyle(16, Colors.black),
                                )
                              ],
                            ),
                          ),
                          flex: 3,
                        )
                      ],
                    ),
                  ),Text(
                    ' MY Rents',
                    style: myStyle(22, Color(0xff1F7F8B)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 0.2, offset: Offset(0, 1))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: size.height * 0.13,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Container(
                              margin: EdgeInsets.all(24),
                              color: Color(0xffE7FCFF),
                              child: Image.asset(
                                'images/home.png',
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Members paid: 20(32)',
                                  style: myStyle(16, Colors.black),
                                ),
                                Text(
                                  'Members unpaid: 12',
                                  style: myStyle(16, Colors.black),
                                )
                              ],
                            ),
                          ),
                          flex: 3,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black87,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group_outlined,
                color: Colors.black87,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.money_sharp,
                color: Colors.black87,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black87,
                size: 30,
              ),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    ));
  }
}
