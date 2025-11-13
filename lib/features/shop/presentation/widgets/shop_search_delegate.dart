import 'package:flutter/material.dart';
import 'package:rolex_boutique/features/shop/presentation/widgets/search_result_tile_widget.dart';
import 'package:rolex_boutique/features/shop/domain/entities/item.dart';

class ShopSearchDelegate extends SearchDelegate {
  final List<Item> searchItems;

  ShopSearchDelegate(this.searchItems);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: const Color(0xFFEEE9E3),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: Colors.grey),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.grey),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = searchItems
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      return const Center(
        child: Text('No results found.'),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return SearchResultTileWidget(item: results[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = searchItems
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (suggestions.isEmpty && query.isNotEmpty) {
      return const Center(
        child: Text('No suggestions found.'),
      );
    }

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return SearchResultTileWidget(item: suggestions[index]);
      },
    );
  }
}
