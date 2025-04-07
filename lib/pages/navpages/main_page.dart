import 'package:flutter/material.dart';
import 'package:tourists_guide/pages/navpages/bar_item_page.dart';
import 'package:tourists_guide/pages/navpages/home_page.dart';
import 'package:tourists_guide/pages/navpages/my_page.dart';
import 'package:tourists_guide/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  int currentindex=0;

  void onTap(int index){
    setState(() {
      currentindex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    List Pages=[
      const HomePage(),
       const BarItemPage(),
       const MyPage(),
       const SearchPage()
    ];
    return Scaffold(
      body: Pages[currentindex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar
      ( currentIndex: currentindex, 
      selectedFontSize: 0,
      unselectedFontSize: 0,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black54,
      unselectedItemColor: Colors.grey.withOpacity(0.5),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
        items: const [
        BottomNavigationBarItem( label : "Home",icon: Icon(Icons.apps)),

        BottomNavigationBarItem( label : "Bar",icon: Icon(Icons.bar_chart_sharp)),
        BottomNavigationBarItem( label : "Search",icon: Icon(Icons.search)),
        BottomNavigationBarItem( label : "My",icon: Icon(Icons.person)),
      ]),
    );
  }
}