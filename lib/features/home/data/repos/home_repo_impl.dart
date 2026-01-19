import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/exception_extentsion.dart';
import 'package:bookly/core/utils/result.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final Dio _dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  HomeRepoImpl._();
  static final HomeRepoImpl instance = HomeRepoImpl._();
  @override
  Future<Result<List<BookModel>>> fetchNewBooks() async {
    try {
      Map<String, dynamic> queryParameters = {
        'q': 'intitle',
        'orderBy': 'newest',
      };
      final response = await _dio.get(
        '/volumes',
        queryParameters: queryParameters,
      );
      List<BookModel> books = _parseBooks(response.data);
      return Success(books);
    } catch (e) {
      return Failure(e.toErrorMessage());
    }
  }

  @override
  Future<Result<List<BookModel>>> fetchRelevantBooks({
    String searchQuery = AppConstants.defaultQuery,
  }) async {
    try {
      Map<String, dynamic> queryParameters = {'q': searchQuery};
      final response = await _dio.get(
        '/volumes',
        queryParameters: queryParameters,
      );
      List<BookModel> books = _parseBooks(response.data);
      return Success(books);
    } catch (e) {
      return Failure(e.toErrorMessage());
    }
  }

  @override
  Future<Result<List<BookModel>>> fetchAuthorBooks({
    required String authorName,
  }) async {
    try {
      Map<String, dynamic> queryParameters = {'q': 'inauthor:$authorName'};
      final response = await _dio.get(
        '/volumes',
        queryParameters: queryParameters,
      );
      List<BookModel> books = _parseBooks(response.data);
      return Success(books);
    } catch (e) {
      return Failure(e.toErrorMessage());
    }
  }

  List<BookModel> _parseBooks(Map<String, dynamic> data) {
    if (data['items'] == null) return List<BookModel>.empty();
    return (data['items'] as List)
        .map((item) => BookModel.fromJson(item))
        .toList();
  }
}
