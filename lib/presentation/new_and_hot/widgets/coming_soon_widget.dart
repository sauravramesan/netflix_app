import 'package:flutter/material.dart';
import 'package:netflix_app/domain/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {super.key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            children:  [
              Text(
                month,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Text(
                day,
                style: const TextStyle(
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               VideoWidget(url: posterPath,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movieName,
                    style: const TextStyle(
                        letterSpacing: -4,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.notifications_outlined,
                        title: 'Remind me',
                        iconSize: 25,
                        textSize: 14,
                      ),
                      kwidth,
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: 'Info',
                        iconSize: 25,
                        textSize: 14,
                      ),
                      kwidth,
                      kwidth,
                    ],
                  ),
                ],
              ),
              kheight,
              Text(
                'Coming on $day $month',
                style: const TextStyle(fontSize: 18),
              ),
              kheight,
              Text(
                movieName,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              kheight,
               Text(
                description,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
