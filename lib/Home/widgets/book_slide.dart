import 'dart:convert';

import 'package:booksapp/Models/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Constants/constants.dart';
import '../../Genre_Des_Page/genre_des_page.dart';
import '../../Services/book.dart';
import 'book_icon.dart';

class BookSlide extends StatefulWidget {
  BookSlide({super.key, required this.title, required this.searchWord});
  String title;
  String searchWord;
  @override
  State<BookSlide> createState() => _BookSlideState();
}

class _BookSlideState extends State<BookSlide> {
  // Future getBookData() async {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: mediumTextStyle.copyWith(fontSize: 22),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: primaryColor,
                  size: 30,
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GenreDesPage(
                          title: widget.title,
                          searchWord: widget.searchWord,
                        )));
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 303,
            child: FutureBuilder(
                future: BookServices.getBookData(
                    "https://www.googleapis.com/books/v1/volumes?q=subject=${widget.searchWord}&filter=ebooks&maxResults=10&orderBy=newest"),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    List<dynamic> objectList =
                        json.decode(snapshot.data)['items'];

                    List<BookModel> books =
                        (json.decode(snapshot.data)['items'] as List)
                            .map((e) => BookModel.fromJson(json.encode(e)))
                            .toList();
                    print(books[0].subtitle);
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
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
                }),
          ),
        ),
      ],
    );
  }
}
