import 'dart:convert';
import 'dart:io';

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/book_model/book_model.dart';

class HomeRepoImplementatin implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementatin(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var response = await apiService.get(
          endPoints: 'volumes?Filtering=free-ebooks&q=subject:love');
      if (response.statusCode == 200) {
        List<BookModel> books = [];
        var result = jsonDecode(response.body);
        for (var item in result['items']) {
          books.add(BookModel.fromJson(item));
        }
        return right(books);
      } else {
        return left(ServerFailure.fromResponse(response.statusCode, response));
      }
    } on SocketException {
      return left(ServerFailure('no internet connection'));
    }
  }



  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
   try {
      var response = await apiService.get(
          endPoints: 'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:drama');
      if (response.statusCode == 200) {
        List<BookModel> books = [];
        var result =jsonDecode(response.body);
        for (var item in result['items']) {
          books.add(BookModel.fromJson(item));
        }
        return right(books);
      } else {
        return left(ServerFailure.fromResponse(response.statusCode, response));
      }
    } on SocketException {
      return left(ServerFailure('no internet connection'));
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category})async {
   try {
      var response = await apiService.get(
          endPoints: 'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$category');
      if (response.statusCode == 200) {
        List<BookModel> books = [];
        var result =jsonDecode(response.body);
        for (var item in result['items']) {
          books.add(BookModel.fromJson(item));
        }
        return right(books);
      } else {
        return left(ServerFailure.fromResponse(response.statusCode, response));
      }
    } on SocketException {
      return left(ServerFailure('no internet connection'));
    }
  }
}
