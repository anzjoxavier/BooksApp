import 'package:booksapp/Book_Des_Page/book_des_page.dart';
import 'package:booksapp/Constants/constants.dart';
import 'package:booksapp/Models/book.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBookIcon extends StatelessWidget {
  SearchBookIcon({super.key, required this.bookModel});
  BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,MaterialPageRoute(
                                  builder: (context) => BookDescriptionPage(bookModel: bookModel,)));
      },
      child: SizedBox(
        height: 215,
        // width: 160,
        // decoration: BoxDecoration(color: Colors.amber),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(7)),
                  child: bookModel.imageLink != null
                      ? Image.network(
                          bookModel.imageLink!,
                          height: 180,
                          width: 120,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          'assets/images/bookaltimage.png',
                          height: 180,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                ),
                const SizedBox(
              width: 20,
            ),
                SizedBox(
                  height: 180,
                width: 215,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${bookModel.title}${bookModel.subtitle != null ? ':${bookModel.subtitle}' : ''}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: searchBookIconTextStyle,
                    ),
                    const SizedBox(height: 5,),
                    Text(
              bookModel.authors != null ? '${bookModel.authors}' : '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: searchBookIconAuthorTextStyle,
            ),
                    const SizedBox(height: 5,),
                    Text(
              bookModel.price != null ? '₹ ${bookModel.price}' : '',
              overflow: TextOverflow.ellipsis,
              style: searchBookIconAuthorTextStyle,
            )
                  
              ],
                )),
              ],
            ),
            
            
            
          ],
        ),
      ),
    );
  }
}