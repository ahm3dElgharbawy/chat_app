import 'package:chat_app/core/common_widgets/buttons/icon_button.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate<T> extends SearchDelegate<T> {
  CustomSearchDelegate(
      {required this.itemToString,
      required this.buildListItem,
      required this.searchList});
  // Dummy list
  final List<T> searchList;
  final String Function(T item) itemToString;
  final Widget Function(T item) buildListItem;

  // These methods are mandatory you cannot skip them.

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      CustomIconButton(
        icon: const Icon(Icons.clear),
        onTap: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return CustomIconButton(
        icon: const Icon(Icons.arrow_back), onTap: () => context.pop());
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<T> searchResults = searchList
        .where((item) =>
            itemToString(item).toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return buildListItem(searchResults[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<T> suggestionList = query.isEmpty
        ? []
        : searchList
            .where((item) =>
                itemToString(item).toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return buildListItem(suggestionList[index]);
      },
    );
  }
}
