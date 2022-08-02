import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/domain/core/constants.dart';
import 'package:netflix_app/presentation/search/search_title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1.1 / 1.6,
              children: List.generate(20, (index) {
                final movie = state.searchResultList[index];
                return MainCard(
                  imageUrl: movie.posterImageUrl,
                );
              }),
            );
          },
        )),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
