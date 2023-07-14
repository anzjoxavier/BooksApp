import 'package:booksapp/Book_Des_Page/book_des_page.dart';
import 'package:booksapp/Constants/constants.dart';
import 'package:booksapp/Models/book.dart';
import 'package:booksapp/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WishListIcon extends StatelessWidget {
  WishListIcon({super.key, required this.bookModel});
  BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDescriptionPage(
                        bookModel: bookModel,
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavBar(selectedIndex: 2,)));
                        },
                      )));
        },
        child: SizedBox(
          height: 303,
          width: 160,
          // decoration: BoxDecoration(color: Colors.amber),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: bookModel.imageLink != null
                    ? Image.network(
                        bookModel.imageLink!,
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
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                  height: 43,
                  child: Text(
                    "${bookModel.title}${bookModel.subtitle != null ? ':${bookModel.subtitle}' : ''}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: bookIconTextStyle,
                  )),
              Text(
                "${bookModel.price != null ? '₹ ${bookModel.price}' : ''}",
                overflow: TextOverflow.ellipsis,
                style: bookIconTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
