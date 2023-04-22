class FavoritableString {
  FavoritableString(
    this.id, {
    required this.string,
    this.isFavorite = false,
  });

  factory FavoritableString.fromJson(Map<String, dynamic> map) =>
      FavoritableString(
        map['id'] as int,
        string: map['string'] as String,
        isFavorite: map['isFavorite'] as bool,
      );

  final String string;
  final int id;
  bool isFavorite;
}
