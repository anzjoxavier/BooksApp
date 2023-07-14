import 'package:booksapp/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';
import '../Home/widgets/book_icon.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                                  text: "Your Wishlist ",
                                  style: GoogleFonts.openSans(
                                      color: primaryColor,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600))
                            ])),
                  ),
                ),
                SizedBox(height: 15,),
                if(MyHomePage.Wishlist.length>0)
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 10),
                  child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                             const   SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 160 / 303,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 3,
                                    mainAxisSpacing: 3),
                            itemCount: MyHomePage.Wishlist.length,
                            itemBuilder: (BuildContext context, int index) {
                              return BookIcon(
                                bookModel: MyHomePage.Wishlist[index],
                              );
                            },
                          ),
                ),
                if(MyHomePage.Wishlist.length==0)
                SizedBox(
                  height: MediaQuery.of(context).size.height-100,
                  child: Center(
                    child: Text("No Books in Wishlist",style: searchBookIconAuthorTextStyle,),
                  ),
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}