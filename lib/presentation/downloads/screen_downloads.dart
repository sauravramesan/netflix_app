import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/domain/core/colors/colors.dart';
import 'package:netflix_app/domain/core/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => kheight,
            itemCount: 3));
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {

    //  });
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        kheight,
        kheight,
        const Text(
          'Introducing Downloads for You',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        kheight,
        const Text(
            'We will download a personalised selection of\nmovies and shows for you, So there is\nsomthing for watch on your\ndevice',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16)),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.downloads!.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                radius: size.width * 0.375,
                              ),
                            ),
                            DownloadsImageWidget(
                              imageList:
                                  '$imageAppendUrl${state.downloads![9].posterPath}',
                              margin: const EdgeInsets.only(
                                  right: 160, bottom: 50, top: 30),
                              angle: -13,
                              size: Size(size.width * 0.4, size.height * 0.26),
                            ),
                            DownloadsImageWidget(
                              imageList:
                                  '$imageAppendUrl${state.downloads![7].posterPath}',
                              margin: const EdgeInsets.only(
                                  left: 160, bottom: 50, top: 30),
                              angle: 13,
                              size: Size(size.width * 0.4, size.height * 0.26),
                            ),
                            DownloadsImageWidget(
                              radius: 50,
                              size: Size(size.width * 0.4, size.height * 0.28),
                              imageList:
                                  '$imageAppendUrl${state.downloads![5].posterPath}',
                              margin: const EdgeInsets.only(top: 1),
                              angle: 0,
                            ),
                          ],
                        ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kButtonColorBlue),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 9),
                child: Text(
                  'Set Up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        kheight,
        kheight,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 55,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kButtonColorWhite),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'See What You Can Download',
                style: TextStyle(color: kBlackColor, fontSize: 17),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kwidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.size,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    this.radius = 10,
  }) : super(key: key);
  final Size size;
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
