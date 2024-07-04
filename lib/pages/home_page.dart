import 'package:flutter/material.dart';
import 'buy_sell_page.dart';
import 'adoption_page.dart';
import 'rescue_page.dart';
import 'package:flutter_app_2/utils/custom_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[
    BuySellPage(),
    AdoptionPage(),
    RescuePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Management App'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Buy & Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Adoption',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Rescue',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
