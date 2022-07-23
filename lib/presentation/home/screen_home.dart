import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/domain/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/background_card.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  Column(
                    children: const [
                      BackgroundCard(),
                      MainTitleCard(
                        title: 'Released in the past year',
                      ),
                      kheight,
                      MainTitleCard(
                        title: 'Trendig Now',
                      ),
                      kheight,
                      NumberTitleCard(),
                      MainTitleCard(
                        title: 'Tense Dramas',
                      ),
                      kheight,
                      MainTitleCard(
                        title: 'South Indian Cinima',
                      ),
                      kheight,
                    ],
                  ),
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                    duration: const Duration(milliseconds: 650),
                      width: double.infinity,
                      height: 130,
                      color: Colors.black.withOpacity(0.35),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              
                              Image.asset('assests/images/netflix.png',width: 80,height: 80,),
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
                          kheight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Text('TV Shows',style: kHomeTextStyle),
                            Text('Movies',style: kHomeTextStyle),
                            Text('Categories',style: kHomeTextStyle)
                            
                          ],),
                        ],
                      ),
                    )
                  : kheight
            ],
          ),
        );
      },
    ));
  }
}
