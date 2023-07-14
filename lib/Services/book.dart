import 'dart:convert';

import 'package:booksapp/Models/book.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class BookServices {
  static Future getBookData(String url) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    return response.body;
  }

  // static putData(BookModel book) async {
  //   Box box = Hive.box('WishBox');
  //   if (box.get('wishList') != null) {
  //     List<dynamic> wishL = [];
  //     wishL.add(book.toMap());
  //     print(wishL[0]);
  //     box.put('wishList', json.encode({'list': wishL}));
  //   } else {
  //     List<dynamic> wishL = json.decode(box.get('wishList'))['list'];
  //     wishL.add(book.toMap());
  //     print(wishL[0]);
  //     box.put('wishList', json.encode({'list': wishL}));
  //   }
  //   box.close();
  // }

  // static bool checkBook(BookModel book, Box box) {
  //   // Box box = Hive.box('WishBox');
  //   // print(box.get('myWishList').toString() + " Hai hello");
  //   if (box.get('length') != null) {
  //     int leng = box.get('length');
  //     for (int i = 1; i <= leng; i++) {
  //       BookModel bookStored = box.get(i);
  //       if (bookStored.id == book.id) {
  //         return true;
  //       }
  //     }
  //   } else {
  //     return false;
  //   }

  //   return false;
  // }

  // static bool addBook(BookModel book) {
  //   Box box = Hive.box('WishBox');
  //   // print(box.get('myWishList').toString() + " Hai hello");
  //   if (box.get('myWishList') != null) {
  //     List<BookModel> wishList = box.get('myWishList');
  //     for (int i = 0; i < wishList.length; i++) {
  //       if (wishList[i].id == book.id) {
  //         return true;
  //       }
  //     }
  //   } else {
  //     return false;
  //   }

  //   return false;
  // }
}
