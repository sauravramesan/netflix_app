
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new/model/hot_and_new.dart';

abstract class HotAndNewService{
  Future<Either<MainFailure,HotAndNew>> getHotAndMovieData();
  Future<Either<MainFailure,HotAndNew>>getHotandNewTvData();
}