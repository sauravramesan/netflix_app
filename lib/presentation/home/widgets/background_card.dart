import 'package:flutter/material.dart';
import 'package:netflix_app/domain/core/colors/colors.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://m.media-amazon.com/images/M/MV5BZmQ5OGQ0NjQtNWJmZi00YjgxLTg5NTAtMjc5OTNjZjc0ZTlkXkEyXkFqcGdeQXVyODY5NzkyMjA@._V1_.jpg'))),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomButtonWidget(
                  title: 'My List',
                  icon: Icons.add,
                ),
                _playButton(),
                const CustomButtonWidget(
                    icon: Icons.info_outline, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: kBlackColor),
        ),
      ),
    );
  }
}
