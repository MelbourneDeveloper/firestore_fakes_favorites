import 'package:favorite_strings_flutter/favoritable_string.dart';
import 'package:favorite_strings_flutter/pages/strings_page.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_fakes/firestore_fakes.dart';

FirebaseFirestore firestore = FirebaseFirestoreFake.stateful();

Future<void> main() async {
  runApp(StringsPage(
    onUpdate: (favoritableString) => firestore
        .collection('strings')
        .doc(favoritableString.id.toString())
        .set(<String, dynamic>{
      'isFavorite': favoritableString.isFavorite,
      'id': favoritableString.id,
      'string': favoritableString.string,
    }),
    favoritedStrings: firestore
        .collection('strings')
        .where('isFavorite', isEqualTo: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => FavoritableString.fromJson(e.data())).toList()
              ..sort((a, b) => a.id.compareTo(b.id))),
    allStrings: firestore
        .collection('strings')
        .where('isFavorite', isNull: false)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => FavoritableString.fromJson(e.data())).toList()
              ..sort((a, b) => a.id.compareTo(b.id))),
  ));

  var collection = firestore.collection('strings');

  await collection.doc('1').set(<String, dynamic>{
    'id': 1,
    'isFavorite': true,
    'string': 'One',
  });

  await collection.doc('2').set(<String, dynamic>{
    'id': 2,
    'isFavorite': false,
    'string': 'Two',
  });
  await collection.doc('3').set(<String, dynamic>{
    'id': 3,
    'isFavorite': false,
    'string': 'Three',
  });
  await collection.doc('4').set(<String, dynamic>{
    'id': 4,
    'isFavorite': false,
    'string': 'Four',
  });
  await collection.doc('5').set(<String, dynamic>{
    'id': 5,
    'isFavorite': false,
    'string': 'Five',
  });
}
