// ignore_for_file: non_constant_identifier_names

import 'package:booksapp/Constants/constants.dart';
import 'package:booksapp/Home/widgets/book_icon.dart';
import 'package:booksapp/Home/widgets/book_slide.dart';
import 'package:booksapp/Home/widgets/square_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Genre_Page/genre_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List GenresList = [
    ['Arts & entertainment', 'Arts+entertainment'],
    ['Biographies & memoirs', 'Biographies+memoirs'],
    ['Business & investing', 'Business+investing'],
    ['Children\'s books', 'Children'],
    ['Computers & technology', 'Computers+technology'],
    ['Cooking, food & wine', 'Cooking+food+wine'],
    ['Engineering', 'Engineering'],
    ['Fiction & literature', 'Fiction+literature'],
    ['Foreign language & study aids', 'Foreign language + study aids'],
    ['Health, mind & body', 'Health+mind+body'],
    ['History', 'History'],
    ['Religion & spirituality', 'Religion + spirituality'],
    ['Romance', 'Romance'],
    ['Self-help', 'Self Help']
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Explore ",
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: "Ebooks ",
                        style: GoogleFonts.openSans(
                            color: primaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w600))
                  ])),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.search,
                        size: 28,
                        color: primaryColor,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SquareButton(
                    buttonName: 'Genres',
                    buttonImgPath: 'assets/images/bookshelf.png',
                    OnTap: () {},
                  ),
                  SquareButton(
                    buttonName: 'Romance',
                    buttonImgPath: 'assets/images/love.png',
                    OnTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GenrePage(
                                    title: "Romance",
                                    searchWord: "Romance",
                                  )));
                    },
                  ),
                  SquareButton(
                    buttonName: 'Comics',
                    buttonImgPath: 'assets/images/comics.png',
                    OnTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GenrePage(
                                    title: "Comics",
                                    searchWord: "Comics",
                                  )));
                    },
                  ),
                  SquareButton(
                    buttonName: 'Cooking',
                    buttonImgPath: 'assets/images/cooking.png',
                    OnTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GenrePage(
                                    title: "Cooking",
                                    searchWord: "Cooking",
                                  )));
                    },
                  ),
                  SquareButton(
                    buttonName: 'Health',
                    buttonImgPath: 'assets/images/health.png',
                    OnTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GenrePage(
                                    title: "Health",
                                    searchWord: "Health",
                                  )));
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: GenresList.length,
              itemBuilder: (context, index) {
              return Column(
                children: [
                  BookSlide(
                    title: GenresList[index][0],
                    searchWord: GenresList[index][1],
                  ),
              SizedBox(
              height: 15,
            ),
                ],
              );
            })
          ],
        ),
      ),
    ));
  }
}
