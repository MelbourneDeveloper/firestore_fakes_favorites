import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritableString {
  final String string;
  final int id;
  bool isFavorite;

  FavoritableString(
    this.id, {
    required this.string,
    this.isFavorite = false,
  });

  static FavoritableString fromJson(Map<String, dynamic> map) =>
      FavoritableString(
        map['id'],
        string: map['string'],
        isFavorite: map['isFavorite'],
      );
}
