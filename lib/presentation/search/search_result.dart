import 'package:flutter/cupertino.dart';
import 'package:netflix_app/domain/core/constants.dart';
import 'package:netflix_app/presentation/search/search_title.dart';

const imageUrl = 'https://m.media-amazon.com/images/M/MV5BOWRjMGE5MWItYTExMy00NDU4LTljZDktNGVhZmUzNTEzYmI1XkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1.1/1.6,
          children: List.generate(20, (index) {
            return const MainCard();
          }),
        )),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
