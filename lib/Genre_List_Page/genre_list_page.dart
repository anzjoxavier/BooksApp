import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';
import '../Genre_Des_Page/genre_des_page.dart';

class GenreList extends StatelessWidget {
  const GenreList({super.key});

  @override
  Widget build(BuildContext context) {
      List GenresListOfItems = [
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
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: RichText(
                      
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Explore ",
                                  style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: "Genres ",
                                  style: GoogleFonts.openSans(
                                      color: primaryColor,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600))
                            ])),
                  ),
                ),
                SizedBox(height: 15,),
                ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: GenresListOfItems.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GenreDesPage(
                          title: GenresListOfItems[index][0],
                          searchWord: GenresListOfItems[index][1],
                        )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 12),
                      child: Text(GenresListOfItems[index][0],style: genreListIconTextStyle,overflow: TextOverflow.ellipsis,),
                    ));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}