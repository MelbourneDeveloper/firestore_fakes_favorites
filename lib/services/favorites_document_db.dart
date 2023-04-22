import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_strings_flutter/favoritable_string.dart';
import 'package:firestore_fakes/firebase_firestore_fake.dart';

class FavoritesDocumentDb {
  FirebaseFirestore firestore = FirebaseFirestoreFake.stateful();

  Future<void> initialise() async {
    final collection = firestore.collection('strings');

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

  Future<void> update(FavoritableString favoritableString) async {
    await firestore
        .collection('strings')
        .doc(favoritableString.id.toString())
        .set(<String, dynamic>{
      'isFavorite': favoritableString.isFavorite,
      'id': favoritableString.id,
      'string': favoritableString.string,
    });
  }

  Stream<List<FavoritableString>> all() =>
      _toFavoritableStrings(_strings().where('isFavorite', isNull: false));

  Stream<List<FavoritableString>> favorites() =>
      _toFavoritableStrings(_strings().where('isFavorite', isEqualTo: true));

  CollectionReference<Map<String, dynamic>> _strings() =>
      firestore.collection('strings');

  Stream<List<FavoritableString>> _toFavoritableStrings(
    Query<Map<String, dynamic>> where,
  ) =>
      where.snapshots().map(
            (event) => event.docs
                .map((e) => FavoritableString.fromJson(e.data()))
                .toList()
              ..sort((a, b) => a.id.compareTo(b.id)),
          );
}
