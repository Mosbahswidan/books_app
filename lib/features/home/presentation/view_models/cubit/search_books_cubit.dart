import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());
  static SearchBooksCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  TextEditingController controller = TextEditingController();
  List<BookModel> books = [];
  Future<void> searchBooks({required String search}) async {
    emit(SearchBooksLoading());
    var result = await homeRepo.searchBooks(search: search);
    result.fold((l) {
      emit(SearchBooksFailure(l.errorMessage));
    }, (r) {
      books = [];
      books = r;
      print(r);
      emit(SearchBooksSuccess());
    });
  }
}
