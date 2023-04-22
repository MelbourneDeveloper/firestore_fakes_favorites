import 'package:favorite_strings_flutter/favoritable_string.dart';
import 'package:favorite_strings_flutter/widgets/string_list_item.dart';
import 'package:flutter/material.dart';

class StringsTab extends StatelessWidget {
  const StringsTab({
    required this.onToggle,
    required this.stream,
    super.key,
  });

  final Stream<List<FavoritableString>> stream;
  final void Function(FavoritableString) onToggle;

  @override
  Widget build(BuildContext context) => StreamBuilder<List<FavoritableString>>(
        stream: stream,
        builder: (context, value) => value.hasData
            ? ListView(
                children: value.data!
                    .map(
                      (favoritableString) => StringListItem(
                        favoritableString: favoritableString,
                        onTap: () => onToggle(
                          favoritableString
                            ..isFavorite = !favoritableString.isFavorite,
                        ),
                      ),
                    )
                    .toList(),
              )
            : const CircularProgressIndicator.adaptive(),
      );
}
