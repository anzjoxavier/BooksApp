// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:booksapp/Constants/constants.dart';
import 'package:booksapp/Models/book.dart';
import 'package:booksapp/Search_Page/widgets/search_book_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Services/book.dart';
import '../Home/widgets/book_icon.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key, required this.title, required this.searchWord});
  String title;
  String searchWord;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String dropdownValue = 'Relevance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 18, left: 18),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ButtonTheme(
                    height: 30,
                    // minWidth: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                      
                      side:  BorderSide(
                    width: 1,
                    color: primaryColor,
                                    ),
                      ),
                      onPressed: (){},
                      child: DropdownButton<String>(
                        
                        iconEnabledColor: primaryColor,
                        isDense: true,
                        // isExpanded: true,
                        iconDisabledColor: primaryColor,
                        style: TextStyle(color: primaryColor),
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        underline: Container(),
                        // Step 3.
                        value: dropdownValue,
                        // Step 4.
                        items: <String>['Relevance', 'Newest']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FutureBuilder(
                  future: BookServices.getBookData(
                      "https://www.googleapis.com/books/v1/volumes?q=${widget.searchWord}&filter=ebooks&maxResults=40&orderBy=$dropdownValue"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      List<BookModel> books =
                          ((json.decode(snapshot.data)['items']) as List)
                              .map((e) => BookModel.fromJson(json.encode(e)))
                              .toList();
                      print(books[0].subtitle);
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // gridDelegate:
                          //     SliverGridDelegateWithFixedCrossAxisCount(
                          //         childAspectRatio: 160 / 303,
                          //         crossAxisCount: 2,
                          //         crossAxisSpacing: 3,
                          //         mainAxisSpacing: 3),
                          itemCount: books.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SearchBookIcon(
                              bookModel: books[index],
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text("No Books to Show"),
                        );
                      }
                    } else {
                      return const Center(
                        child: Text("Something Went Wrong"),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
