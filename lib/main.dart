import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bottom Nav',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.red,
        useMaterial3: true,
      ),
      home: NotchedHomePage(),
    );
  }
}

class NotchedHomePage extends StatefulWidget {
  const NotchedHomePage({super.key});

  @override
  State<NotchedHomePage> createState() => _NotchedHomePageState();
}

class _NotchedHomePageState extends State<NotchedHomePage> {
  final _controller = NotchBottomBarController();
  int _selectedIndex = 0;

  final List<String> _pages = [
    "Home Page",
    "Favorites",
    "Search",
    "Settings",
    "Account"
  ];

  static Widget _buildPage(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.redAccent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Flutter Bottom Nav', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _buildPage(_pages[_selectedIndex]),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        showLabel: false,
        notchColor: Colors.redAccent,
        color: Colors.redAccent.shade200,
        durationInMilliSeconds: 300,
        removeMargins: false,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_outlined, color: Colors.white),
            activeItem: Icon(Icons.home_rounded, color: Colors.white),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.star_border_rounded, color: Colors.white),
            activeItem: Icon(Icons.star_rounded, color: Colors.white),
            itemLabel: 'Favorites',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.search_outlined, color: Colors.white),
            activeItem: Icon(Icons.search_rounded, color: Colors.white),
            itemLabel: 'Search',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.settings_outlined, color: Colors.white),
            activeItem: Icon(Icons.settings_rounded, color: Colors.white),
            itemLabel: 'Settings',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person_outlined, color: Colors.white),
            activeItem: Icon(Icons.person_rounded, color: Colors.white),
            itemLabel: 'Account',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        kIconSize: 26.0,
        kBottomRadius: 20.0,
        bottomBarHeight: 72,
        shadowElevation: 8,
      ),
    );
  }
}
