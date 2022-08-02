import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/domain/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight,
        Row(
          children: [
            kwidth,
            Text(
              title,
              style: GoogleFonts.montserrat()
                  .copyWith(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            const Spacer(),
            const Icon(
              Icons.cast,
              color: Colors.white,
            ),
            kwidth,
            Container(
              width: 30,
              height: 30,
              color: Colors.blue,
            ),
            kwidth,
          ],
        ),
      ],
    );
  }
}
