import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/domain/core/colors/colors.dart';
import 'package:netflix_app/domain/core/constants.dart';
import 'package:netflix_app/presentation/search/search_title.dart';

const imageUrl =
    'https://gumlet.assettype.com/dtnext%2F2022-04%2Ffeba4c73-89d0-481e-842e-b4eeb9020236%2F08730dbc_bf11_48d7_86f5_71bba9a7cf85.jpg?auto=format%2Ccompress&fit=max&format=webp&w=768&dpr=1.3';

class SearchIdelWidget extends StatelessWidget {
  const SearchIdelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches',),
        kheight,
        kheight,
        kheight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => const TopSearchItemTile(),
            separatorBuilder: (ctx, index) => kheight,
            itemCount: 100,
          ),
        )
      ],
    );
  }
}


class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 80,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 15, 
                color: Colors.white,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 23,
            child: Icon(CupertinoIcons.play_fill,color: kWhiteColor,),
          ),
        )
      ],
    );
  }
}
