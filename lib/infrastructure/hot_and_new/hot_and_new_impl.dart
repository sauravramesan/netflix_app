import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/core/api_end_points.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_app/domain/hot_and_new/model/hot_and_new.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplemenation implements HotAndNewService{
  @override
  Future<Either<MainFailure, HotAndNew>> getHotAndMovieData() async{
    try{
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        final result =HotAndNew.fromJson(response.data);
        
      
        return Right(result);
      }else{
        return const Left(MainFailure.serverFailure());
      }
    }on DioError catch(e){
      log(e.message);
      return const Left(MainFailure.ClientFailure());
    }catch (e){
      log(e.toString());
      return const Left(MainFailure.ClientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNew>> getHotandNewTvData() async{
    try{
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        final result =HotAndNew.fromJson(response.data);
        return Right(result);
      }else{
        return const Left(MainFailure.serverFailure());
      }
    }on DioError catch(e){
      log(e.message);
      return const Left(MainFailure.ClientFailure());
    }catch (e){
      return const Left(MainFailure.ClientFailure());
    }
  }
  
}