
import 'package:flutter/material.dart';
import 'package:royex_test/description.dart';
import 'package:royex_test/notofication.dart';

import 'home_screen.dart';
import 'more.dart';
class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorPage> createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  int i=0;
  var pages = [
    const HomePage(),
    const Description(),
    const NotificationPage(),
    const MorePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: Colors.lightBlue.shade50,
        unselectedItemColor: Colors.grey[800],
        selectedItemColor: Color.fromRGBO(10, 135, 255, 1),
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'1st Page', //new Text('Home'),
          ),
          BottomNavigationBarItem(
              icon:  Icon(Icons.pages),
              //title: new Text('Blog'),
              label:'2nd Page'
          ),
          BottomNavigationBarItem(
              icon:  Icon(Icons.notifications_active_outlined),
              //title: new Text('Order'),
              label: 'Notification'
          ),
          BottomNavigationBarItem(
              icon:  Icon(Icons.view_column_outlined),
              //title: new Text('More'),
              label: 'More'
          ),
        ],
        currentIndex: i,

        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            i = index;
          });
        },
      ),
      body:pages.elementAt(i),
    );
  }
}
