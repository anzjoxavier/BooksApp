import 'dart:convert';


import 'package:hive/hive.dart';

part 'book.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@HiveType(typeId: 1)
class BookModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String? subtitle;

  @HiveField(3)
  String? authors;

  @HiveField(4)
  String? publisher;

  @HiveField(5)
  String? publishedDate;

  @HiveField(6)
  String? description;

  @HiveField(7)
  double? pageCount;

  @HiveField(8)
  String? imageLink;

  @HiveField(9)
  String? buyLink;

  @HiveField(10)
  double? price;

  BookModel(
      {required this.id,
      required this.title,
      this.subtitle,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.imageLink,
      this.buyLink,
      this.price});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'description': description,
      'pageCount': pageCount,
      'imageLink': imageLink,
      'buyLink': buyLink,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] as String,
      title: map['volumeInfo']['title'] as String,
      subtitle: map['volumeInfo']['subtitle'] != null
          ? map['volumeInfo']['subtitle'] as String
          : null,
      authors: map['volumeInfo']['authors'] != null
          ? map['volumeInfo']['authors'].join(',') as String
          : null,
      publisher: map['volumeInfo']['publisher'] != null
          ? map['volumeInfo']['publisher'] as String
          : null,
      publishedDate: map['volumeInfo']['publishedDate'] != null
          ? map['volumeInfo']['publishedDate'] as String
          : null,
      description: map['volumeInfo']['description'] != null
          ? map['volumeInfo']['description'] as String
          : null,
      pageCount: map['volumeInfo']['pageCount'] != null
          ? (map['volumeInfo']['pageCount']).toDouble()
          : null,
      imageLink: map['volumeInfo']['imageLinks'] != null
          ? map['volumeInfo']['imageLinks']['smallThumbnail'] as String
          : null,
      buyLink: map['saleInfo']['buyLink'] != null
          ? map['saleInfo']['buyLink'] as String
          : null,
      price: map['saleInfo']['retailPrice'] != null
          ? (map['saleInfo']['retailPrice']['amount']).toDouble()
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
