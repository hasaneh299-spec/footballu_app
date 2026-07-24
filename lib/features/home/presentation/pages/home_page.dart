import 'package:flutter/material.dart';
import '../../../matches/presentation/pages/matches_page.dart';
import '../../../news/presentation/pages/news_page.dart';
import '../../../standings/presentation/pages/standings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    MatchesPage(),
    NewsPage(),
    StandingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'المباريات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'الأخبار',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'الترتيب',
          ),
        ],
      ),
    );
  }
}
