import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/domain/core/colors/colors.dart';
import 'package:netflix_app/domain/core/constants.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import '../../application/hotAndNew/hot_and_new_bloc.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
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
          const ComingSoonList(key: Key('coming_soon'),),
          _buildEveryonesWatching(),
        ]),
      ),
    );
  }
  Widget _buildEveryonesWatching(){
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index)=> const SizedBox());
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
         if(state.isLoading){
              return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
            }else if(state.hasError){
              return const Center(
                child: Text('Error While loading coming soon list'),
              );
            }else if(state.comingSoonList.isEmpty){
              return const Center(
                child: Text('Coming soon list is empty'),
              );
            }else{
          return ListView.builder(
          itemCount: state.comingSoonList.length,
          itemBuilder: (BuildContext context, index) {
           final movie = state.comingSoonList[index];
        log(movie.posterPath.toString());
          
           String month ='';
           String date ='';
           try{final date = DateTime.tryParse(movie.releaseDate!);
           final formatedDate = DateFormat.yMMMMd('en_US').format(date!);
           month = formatedDate.split('').first.substring(0,3).toUpperCase();
          //  date = movie.releaseDate!.split('-')[1];
           }
           catch(_){
            month = '';
            date = '';
           }
           
          //  log(formatedDate.toString());
           return ComingSoonWidget(
            id: movie.id.toString(), 
            month:month,  
            day: '11',
            posterPath: '$imageAppendUrl${movie.posterPath}', 
            movieName: movie.originalTitle.toString(), 
            
            description: movie.overview??'No description',
            );

          },
        );
            }
      
      },
    );
  }
}
