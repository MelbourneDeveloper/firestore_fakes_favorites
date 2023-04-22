import 'package:favorite_strings_flutter/favoritable_string.dart';
import 'package:flutter/material.dart';

class StringListItem extends StatelessWidget {

  const StringListItem({
    required this.favoritableString,
    required this.onTap,
    super.key,
  });
  
  final FavoritableString favoritableString;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onTap,
        title: Text(favoritableString.string),
        trailing: Icon(
          Icons.favorite,
          color: favoritableString.isFavorite ? Colors.red : Colors.grey,
        ),
      );
}
