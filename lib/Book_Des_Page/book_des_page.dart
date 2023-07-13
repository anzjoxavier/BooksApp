// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:booksapp/Constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';
import '../Models/book.dart';

// ignore: must_be_immutable
class BookDescriptionPage extends StatefulWidget {
  BookDescriptionPage({super.key, required this.bookModel});
  BookModel bookModel;

  @override
  State<BookDescriptionPage> createState() => _BookDescriptionPageState();
}

class _BookDescriptionPageState extends State<BookDescriptionPage> {
  IconData wishListIcon = CupertinoIcons.bookmark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 20),
            child: Column(
              children: [
                //Img and Name
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //image
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: widget.bookModel.imageLink != null
                          ? Image.network(
                              widget.bookModel.imageLink!,
                              height: 235,
                              width: 160,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              'assets/images/bookaltimage.png',
                              height: 235,
                              width: 160,
                              fit: BoxFit.fill,
                            ),
                    ),
                    //Title, Subtitle, Author, Publisher
                    Container(
                      width: 155,
                      margin: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 155,
                            child: Text(
                              "${widget.bookModel.title}${widget.bookModel.subtitle != null ? ':${widget.bookModel.subtitle}' : ''}",
                              style: bookDescriptionTextStyle,
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (widget.bookModel.authors != null)
                            const SizedBox(
                              height: 8,
                            ),
                          if (widget.bookModel.authors != null)
                            Text(
                              widget.bookModel.authors!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: authorNameTextStyle,
                            ),
                          if (widget.bookModel.publisher != null)
                            const SizedBox(
                              height: 6,
                            ),
                          if (widget.bookModel.publisher != null)
                            Text(
                              widget.bookModel.publisher!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: publisherNameTextStyle,
                            ),
                          if (widget.bookModel.publishedDate != null)
                            const SizedBox(
                              height: 6,
                            ),
                          if (widget.bookModel.publishedDate != null)
                            Text(
                              "Released \n${convertToCharacterDate(widget.bookModel.publishedDate!)}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: publisherNameTextStyle,
                            )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                //Info Row
                SizedBox(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_outlined,
                            size: 38,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "eBook",
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      const SizedBox(height: 50, child: VerticalDivider()),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.bookModel.pageCount != null
                                ? (widget.bookModel.pageCount)!.toInt().toString()
                                : "N.A",
                            style: GoogleFonts.openSans(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600]),
                          ),
                          // SizedBox(height: 1,),
                          Text("Pages",
                              style: TextStyle(color: Colors.grey[600]))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Cart and Buy Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: StatefulBuilder(builder: (context, setState) {
                        return ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: primaryColor)),
                              textStyle: buyButtonTextStyle),
                          label: Text(
                            'Wishlist',
                            style: buyButtonTextStyle.copyWith(
                                color: primaryColor, fontSize: 16),
                          ),
                          icon: Icon(
                            wishListIcon,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              if (wishListIcon == CupertinoIcons.bookmark) {
                                wishListIcon = CupertinoIcons.bookmark_fill;
                              } else {
                                wishListIcon = CupertinoIcons.bookmark;
                              }
                            });
                          },
                        );
                      }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                        
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            textStyle: buyButtonTextStyle),
                        child: Text(
                          'Buy ${widget.bookModel.price != null ? '₹ ${widget.bookModel.price}' : ''}',
                          style: buyButtonTextStyle,
                        ),
                        onPressed: () {
                          if(widget.bookModel.buyLink!=null)
                          {
                            _launchURL(widget.bookModel.buyLink!);}
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                const Divider(),
                SizedBox(
                  height: 20,
                ),
                if (widget.bookModel.description != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About this eBook",
                        style: subHeadingTextStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.bookModel.description!,
                        style: paragraphTextStyle,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
_launchURL(String _url) async {
  final Uri url = Uri.parse(_url);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

String convertToCharacterDate(String numericDate) {
  List<String> dateParts = numericDate.split('-');
  int year = int.parse(dateParts[0]);
  int month = dateParts.length > 1 ? int.parse(dateParts[1]) : 0;
  int day = dateParts.length > 2 ? int.parse(dateParts[2]) : 0;

  if (year == 0) {
    return '';
  }

  if (month == 0) {
    return '$year';
  }

  String monthName = getMonthName(month);
  String dayString = day != 0 ? '$day' : '';

  // String ordinalIndicator = getOrdinalIndicator(day);

  return '$dayString $monthName $year';
}

String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      throw Exception('Invalid month: $month');
  }
}
