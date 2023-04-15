import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movie_test/page/list/view.dart';
import 'package:movie_test/page/provile/hendi.dart';
import 'package:movie_test/page/search/view.dart';
import 'package:movie_test/page/wishlist/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ListViewMovie(),
    const WishList(),
    const ProfileHendiGunawan(),
  ];

  void _onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
        actions: [
          // Navigate to the Search Screen
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const SearchView(),
              ),
            ),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              LineIcons.film,
            ),
            label: "List Movie",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineIcons.heartAlt,
            ),
            label: "WishList",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineIcons.user,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: _onItemTaped,
      ),
    );
  }
}
