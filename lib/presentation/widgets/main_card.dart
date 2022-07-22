import 'package:flutter/material.dart';
import 'package:netflix_app/domain/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: const DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/99/f8/70/99f8702093bd74454c4636a33f558c4a.jpg'),
                fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}