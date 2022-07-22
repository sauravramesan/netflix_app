import 'package:flutter/material.dart';
import 'package:netflix_app/domain/core/constants.dart';
import 'package:netflix_app/presentation/widgets/main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,required this.title
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => const MainCard()),
          ),
        )
      ],
    );
  }
}