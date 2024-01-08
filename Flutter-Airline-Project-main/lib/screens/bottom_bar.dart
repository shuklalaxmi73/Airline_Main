
import 'package:aeroplane/screens/search_screen.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();

}
class _BottomBarState extends State<BottomBar>{
  int _selectedindex=0;
  static final List<Widget>_widgetOptions=<Widget>[
  const Homescreen(),
  const SearchScreen(),
const Text("Tickets"),
const Text("Profile")
  ];
  void _onItemTapped(int index)
  {
    setState((){
      _selectedindex=index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body:  Center(child: _widgetOptions[_selectedindex],
      ),
bottomNavigationBar: BottomNavigationBar(
  currentIndex: _selectedindex,
  onTap:_onItemTapped,
  elevation: 10,
  showSelectedLabels: false,
  showUnselectedLabels: false,
  selectedItemColor: Colors.black,
  unselectedItemColor: Colors.grey,
  type:BottomNavigationBarType.fixed,
  
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
 BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
   BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket),label: "Tickets"),
    BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
 ],
 ),
    );
  }
}
