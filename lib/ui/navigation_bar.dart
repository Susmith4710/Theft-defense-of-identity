
import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:idd_app/ui/dashboard_screen.dart';



class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    // Text(
    //   'Index 0: Home',
    //   style: optionStyle,
    // ),
    Center(
      child: DashboardScreen(),
    ),
    Text(
      '',
      style: optionStyle,
    ),
    Text(
      '',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Row(
      //     children: [
      //       Column(
      //         children: [
      //           Center(
      //               child: Row(
      //             children: [
      //               const Text(
      //                 'DashBoard',
      //                 textAlign: TextAlign.center,
      //               ),
      //               // SizedBox(
      //               //   width: 10,
      //               // ),
      //               Image(
      //                   image:
      //                       AssetImage('asset/icons/menu/account/stroke.png'))
      //             ],
      //           )),
      //           //Image.asset('assets/stroke.png'),
      //           SizedBox(
      //             height: 18,
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              // Row(
              //   children: [
              //     Center(
              //       child: Center(
              //         child: Text(
              //           "DashBoard",
              //           style: TextStyle(
              //               fontSize: 16,
              //               color: Colors.black,
              //               fontFamily: 'gordita',
              //               fontWeight: FontWeight.w500),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 150,
                  ),
                  Text(
                    "DashBoard",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'gordita',
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Expanded(
                    child: Image(image: AssetImage('assets/person.png')),
                  ),
                  // SizedBox(
                  //   width: 20,
                  // )
                ],
              ),

              SizedBox(
                height: 18,
              ),
              Text(
                "Welcome, John Doe",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Gordita',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Monitoring is active...",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF21AC5F),
                    fontFamily: 'gordita',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Last Logged in:",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'gordita',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Mar, 8 2022",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF636870),
                      fontFamily: 'gordita',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Card(
                // child: Row(
                //.   children: [
                child: Container(
                  height: 56,
                  width: 343,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 19,
                      ),
                      // Image(image: AssetImage('assets/dangertriangle.png')),
                      Icon(Icons.warning_amber_rounded),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Active Alerts",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'gordita',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: InkWell(
                            child: Text(
                              "3",
                              style: const TextStyle(
                                  fontFamily: 'Gordita',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const EnrollScreen()),
                            //   );
                            // },
                          ),
                        ),
                        // child: Text("3"),
                      )
                    ],
                  ),
                  //   ),
                  //  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),

              Card(
                child: Container(
                  height: 88,
                  width: 343,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 17,
                          ),
                          Image.asset('assets/watchlist.png'),
                          // Icon(AuraIcons.Wallet),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            'WatchList',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 154,
                          ),
                          InkWell(
                            child: Text(
                              " Add",
                              style: const TextStyle(
                                  fontFamily: 'Gordita',
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(45, 202, 115, 1),
                                  fontSize: 16),
                            ),
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const EnrollScreen()),
                            //   );
                            // },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Actively monitoring items",
                            style: TextStyle(
                                color: Color.fromRGBO(99, 104, 112, 1)),
                          ),
                          SizedBox(
                            width: 110,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            child: CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 109, 212, 162),
                              child: InkWell(
                                child: Text(
                                  "12",
                                  style: const TextStyle(
                                      fontFamily: 'Gordita',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const EnrollScreen()),
                                  // );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Card(
                child: Container(
                  height: 88,
                  width: 343,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 19,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          // Image.asset('assets/person.png'),
                          Icon(AuraIcons.user_add),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            'Protect Loved ones',
                            style: TextStyle(
                                color: Color.fromRGBO(21, 24, 29, 1),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 36,
                          ),
                          InkWell(
                            child: Text(
                              "Learn More",
                              style: const TextStyle(
                                  fontFamily: 'Gordita',
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(45, 202, 115, 1),
                                  fontSize: 16),
                            ),
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const EnrollScreen()),
                            //   );
                            // },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Add your Family member",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(99, 104, 112, 1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Card(
              //   child: Container(
              //     height: 240,
              //     width: 343,
              //     child: _widgetOptions.elementAt(_selectedIndex),
              //   ),
              // )
              Column(
                children: [
                  // Center(
                  _widgetOptions.elementAt(_selectedIndex),
                  // ),
                  //  Text('0'),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/dashboard.png"),
              color: Colors.black,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/watchlist.png"),
              color: Colors.black,
            ),
            label: 'WatchList',
          ),
          BottomNavigationBarItem(
              icon: Icon(AuraIcons.Notifications_cutout),
              label: "Alerts"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        selectedIconTheme: IconThemeData(color: Colors.green),
        onTap: _onItemTapped,
      ),
    );
  }
}
