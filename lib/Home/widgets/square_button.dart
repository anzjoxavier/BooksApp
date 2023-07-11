import 'package:booksapp/Constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SquareButton extends StatelessWidget {
  SquareButton({super.key,required this.buttonName,required this.buttonImgPath});
  String buttonName;
  String buttonImgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      // padding: const EdgeInsets.all(10),
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1.5),
        borderRadius: BorderRadius.circular(7),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Row(
              children: [
                Image.asset(
                  buttonImgPath,
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  buttonName,
                  style: mediumTextStyle.copyWith(color: Colors.grey[700]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
