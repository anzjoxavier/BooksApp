import 'package:booksapp/Constants/constants.dart';
import 'package:booksapp/Search_Page/search_page.dart';
import 'package:flutter/material.dart';

import '../../Genre_Page/genre_page.dart';

class CustomSearchDelegateNew extends SearchDelegate {


  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return theme.copyWith(
      
      appBarTheme: AppBarTheme(
        // brightness: colorScheme.brightness,
        backgroundColor: colorScheme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: primaryColor),
        // iconTheme: theme.textTheme,
      ),
      // textSelectionTheme: TextSelectionThemeData(
      //   selectionHandleColor: primaryColor, // Change bubble to red
      //   cursorColor: Colors.white,
      // ), 
      
      textTheme: TextTheme(titleLarge: TextStyle(color: primaryColor,fontSize: 20) ),
      inputDecorationTheme:
          InputDecorationTheme(
            hintStyle: TextStyle(color: primaryColor),
            
            fillColor: primaryColor,
            border: InputBorder.none,
            
          ),
    );
  }
  List<String> SearchTerms = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }
  @override
  void showResults(BuildContext context) {
    super.showResults(context);
    showSuggestions(context);
    FocusScope.of(context).unfocus();
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage(
                                    title: query,
                                    searchWord: query,
                                  )));
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    print(query);
    for (var i in SearchTerms) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(matchQuery[index]));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var i in SearchTerms) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(matchQuery[index]));
      },
    );
  }
}
