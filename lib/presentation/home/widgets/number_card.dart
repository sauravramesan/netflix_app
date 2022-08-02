import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/domain/core/colors/colors.dart';
import 'package:netflix_app/domain/core/constants.dart';

class Numbercard extends StatelessWidget {
  const Numbercard({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 50,
              width: 50,
            ),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/564x/99/f8/70/99f8702093bd74454c4636a33f558c4a.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        Positioned(
            left: -7,
            top: 79,
            child: BorderedText(
                strokeWidth: 7,
                strokeColor: kWhiteColor,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      decorationColor: kWhiteColor,
                      fontSize: 145,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor),
                )))
      ],
    );
  }
}
