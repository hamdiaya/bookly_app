import 'dart:convert';
import 'dart:io';

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String subject}) async {
    try {
      var response = await apiService.get(
          endPoints: 'volumes?Filtering=free-ebooks&q=subject:$subject');
      if (response.statusCode == 200) {
        List<BookModel> books = [];
        var result = jsonDecode(response.body);
        if (result['items'] == null) {
          return left(ServerFailure('no books'));
        } else {
          for (var item in result['items']) {
            books.add(BookModel.fromJson(item));
          }
          return Right(books);
        }
      } else {
        return left(ServerFailure.fromResponse(response.statusCode, response));
      }
    } on SocketException {
      return left(ServerFailure('no internet connection'));
    }
  }
}
