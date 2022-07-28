import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/core/api_end_points.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async{
    try {
      final Response response = await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if(response.statusCode == 200 || response.statusCode == 201){
       final downloadsList = (response.data['results'] as List).map((e){
        return Downloads.fromJson(e);
       }).toList();
        print(downloadsList);
        return Right(downloadsList);
      }else{
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.ClientFailure());
    }
  }
  
}