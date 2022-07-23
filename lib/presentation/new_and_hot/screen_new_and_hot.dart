import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/domain/core/colors/colors.dart';
import 'package:netflix_app/domain/core/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            title: Text(
              'New & Hot',
              style: GoogleFonts.montserrat()
                  .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              kwidth,
              Center(
                child: Container(
                  width: 23,
                  height: 23,
                  color: Colors.blue,
                ),
              ),
              kwidth,
            ],
            bottom: TabBar(
                isScrollable: true,
                labelColor: kBlackColor,
                unselectedLabelColor: kWhiteColor,
                indicator:
                    BoxDecoration(color: kWhiteColor, borderRadius: kRadius30),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(text: "👀 Everyones's Watching"),
                ]),
          ),
        ),
        body: TabBarView(children: [
          _buildComingSoon(context),
          _buildEveryoneWatching(),
        ]),
      ),
    );
  }

  _buildComingSoon(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        kheight,
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 500,
              child: Column(
                children: const [
                  Text(
                    'FEB',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  Text(
                    '11',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width - 50,
              height: 500,
              color: kWhiteColor,
            ),
          ],
        ),
      ],
    );
  }

  _buildEveryoneWatching() {
    return Text('Hello');
  }
}
