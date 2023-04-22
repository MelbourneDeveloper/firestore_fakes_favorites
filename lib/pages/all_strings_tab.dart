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
                      (e) => StringListItem(
                        favoritableString: e,
                        onTap: () => onToggle(e..isFavorite = !e.isFavorite),
                      ),
                    )
                    .toList(),
              )
            : const CircularProgressIndicator.adaptive(),
      );
}
