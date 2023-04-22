import 'package:favorite_strings_flutter/pages/strings_page.dart';
import 'package:favorite_strings_flutter/services/favorites_document_db.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  final favoritesDocumentDb = FavoritesDocumentDb();
  await favoritesDocumentDb.initialise();

  runApp(
    StringsPage(
      onUpdate: (favoritableString) async =>
          favoritesDocumentDb.update(favoritableString),
      favoritedStrings: favoritesDocumentDb.favorites(),
      allStrings: favoritesDocumentDb.all(),
    ),
  );
}
