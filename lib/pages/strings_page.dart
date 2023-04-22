import 'package:favorite_strings_flutter/favoritable_string.dart';
import 'package:favorite_strings_flutter/pages/strings_tab.dart';
import 'package:flutter/material.dart';

class StringsPage extends StatefulWidget {
  const StringsPage({
    required this.allStrings,
    required this.favoritedStrings,
    required this.onUpdate,
    super.key,
  });

  final Stream<List<FavoritableString>> allStrings;
  final Stream<List<FavoritableString>> favoritedStrings;
  final void Function(FavoritableString) onUpdate;

  @override
  State<StringsPage> createState() => _StringsPageState();
}

class _StringsPageState extends State<StringsPage> {
  int _index = 0;

  void _updateIndex(int newIndex) {
    setState(() {
      _index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favorite Strings',
        home: Scaffold(
          body: IndexedStack(
            index: _index,
            children: [
              StringsTab(
                stream: widget.allStrings,
                onToggle: widget.onUpdate,
              ),
              StringsTab(
                stream: widget.favoritedStrings,
                onToggle: widget.onUpdate,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: _updateIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: 'All',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
            ],
          ),
        ),
      );
}
