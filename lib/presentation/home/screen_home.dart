import 'package:flutter/material.dart';
import 'package:netflix_app/domain/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/background_card.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: const [
              BackgroundCard(),
              MainTitleCard(title: 'Released in the past year',),
              kheight,
              MainTitleCard(title: 'Trendig Now',),
              kheight,
              NumberTitleCard(),
              MainTitleCard(title: 'Tense Dramas',),
              kheight,
              MainTitleCard(title: 'South Indian Cinima',),
              kheight,
            ],
          ),
        ],
      ),
    );
  }

}







