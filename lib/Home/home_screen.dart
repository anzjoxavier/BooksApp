import 'package:booksapp/Constants/constants.dart';
import 'package:booksapp/Home/widgets/book_icon.dart';
import 'package:booksapp/Home/widgets/square_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Explore ",style: GoogleFonts.openSans(color: Colors.black,fontSize: 26,fontWeight: FontWeight.w600)),
                  TextSpan(text: "Ebooks ",style: GoogleFonts.openSans(color: primaryColor,fontSize: 28,fontWeight: FontWeight.w600))
                ]
              )),
              IconButton(
                onPressed: (){

                },
                icon: Icon(CupertinoIcons.search,size: 28,color: primaryColor,))
            ],
          ),
          
        ),
        const SizedBox(height: 25,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 90,
          child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
              SquareButton(buttonName: 'Genres', buttonImgPath: 'assets/images/bookshelf.png',),
              SquareButton(buttonName: 'Romance', buttonImgPath: 'assets/images/love.png',),
              SquareButton(buttonName: 'Comics', buttonImgPath: 'assets/images/comics.png',),
              SquareButton(buttonName: 'Cooking', buttonImgPath: 'assets/images/cooking.png',),
              SquareButton(buttonName: 'Health', buttonImgPath: 'assets/images/health.png',),
              SizedBox(width: 15,)
            ],
        ),
        ),
        const SizedBox(height: 15,),
        InkWell(
          onTap: (){},
          child: Padding(
            padding:const EdgeInsets.all( 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Fiction & literature",style: mediumTextStyle.copyWith(fontSize: 22),),
                Icon(Icons.arrow_forward,color: primaryColor,size: 30,)
              ],
            ),
            
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 303,
            child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                  BookIcon(),
                  BookIcon(),
                  BookIcon(),
                  BookIcon(),
                  // SizedBox(width: 15,)
                ],
            ),
          ),
        ),


      ],
    )
    );
  }
}