import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/domain/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/video_widget.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryoneWatchingWidget(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const Text(
          'Friends',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          'This hit sitcom follows the merry misadvantures of six 20-something pais as they navigate the pitfalls of work, life and love in 1990s Manhattan',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        kheight25,
        VideoWidget(url: posterPath,),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            kwidth,
            CustomButtonWidget(
              icon: CupertinoIcons.paperplane,
              title: 'Share',
              iconSize: 23,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              textSize: 15,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 27,
              textSize: 16,
            ),
            kwidth,
          ],
        ),
      ],
    );
  }
}
