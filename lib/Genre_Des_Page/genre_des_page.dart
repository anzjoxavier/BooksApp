// ignore_for_file: must_be_immutable
import 'dart:convert';

import 'package:booksapp/Models/book.dart';
import 'package:flutter/material.dart';
import '../../Services/book.dart';
import '../Constants/constants.dart';
import '../Home/widgets/book_icon.dart';

class GenreDesPage extends StatelessWidget {
  GenreDesPage({super.key, required this.title, required this.searchWord});
  String title;
  String searchWord;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: primaryColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 12, left: 28),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: BookServices.getBookData(
                      "https://www.googleapis.com/books/v1/volumes?q=subject=${searchWord}&filter=ebooks&maxResults=40&orderBy=newest"),
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
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 160 / 303,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 3),
                          itemCount: books.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BookIcon(
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
