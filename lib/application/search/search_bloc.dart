import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:netflix_app/domain/search/model/search_resp/search_resp.dart';
import 'package:netflix_app/domain/search/search_service.dart';
part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService searchService;

  SearchBloc(this.searchService, this._downloadsService)
      : super(SearchState.initial()) {
    on<Initialize>(
      (event, emit) async {
        if (state.idleList.isNotEmpty) {
          emit(state);
          return;
        }
        emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false));
        final result = await _downloadsService.getDownloadsImages();
        final state1 = result.fold(
          (MainFailure f) {
            return const SearchState(
                searchResultList: [],
                idleList: [],
                isLoading: false,
                isError: true);
          },
          (List<Downloads> list) {
            return SearchState(
                searchResultList: [],
                idleList: list,
                isLoading: false,
                isError: false);
          },
        );
        emit(state1);
      },
    );

    on<SearchMovie>(
      (event, emit) async {
        log('Searching for ${event.movieQuery}');
        emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false));
        final result =
            await searchService.searchMovies(movieQuery: event.movieQuery);
        final state = result.fold(
          (MainFailure f) {
            return const SearchState(
                searchResultList: [],
                idleList: [],
                isLoading: false,
                isError: true);
          },
          (SearchResp r) {
            return SearchState(
              searchResultList: r.results,
              idleList: [],
              isLoading: false,
              isError: false,
            );
          },
        );
        emit(state);
      },
    );
  }
}
