import 'package:booksapp/Constants/constants.dart';
import 'package:flutter/material.dart';

class BookIcon extends StatelessWidget {
  const BookIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:15),
      child: InkWell(
        onTap: (){
          
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Image.network("http://books.google.com/books/content?id=s1KPmgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",height: 235,
          width: 160,fit: BoxFit.fill,),
          ),
          const SizedBox(height: 3,),
          SizedBox(
            height: 43,
            child: Text("Ruling Sheikh, Unruly Mistress(Mills & Boon Modern Heat)",overflow: TextOverflow.ellipsis,maxLines: 2,style: bookIconTextStyle,)),
           Text("₹123.95",overflow: TextOverflow.ellipsis,style: bookIconTextStyle,) 
      
          
            ],
          ),
        ),
      ),
    );
  }
}