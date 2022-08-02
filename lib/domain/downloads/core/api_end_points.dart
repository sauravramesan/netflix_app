import 'package:netflix_app/domain/core/strings.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = '$kBaseUrl/trending/all/week?api_key=$apiKey';
  static const search ='$kBaseUrl/search/movie?api_key=$apiKey&language=en-US&page=1&include_adult=false';
  static const hotAndNewMovie ='$kBaseUrl/discover/movie?api_key=069ff9fdab6b8f76aa9a72b1d8543ea8';
  static const hotAndNewTv ='$kBaseUrl/discover/tv?api_key=069ff9fdab6b8f76aa9a72b1d8543ea8';
}
