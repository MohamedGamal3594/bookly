import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/exception_extentsion.dart';
import 'package:bookly/core/utils/result.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final Dio _dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  HomeRepoImpl._privateConstructor();
  static final HomeRepoImpl instance = HomeRepoImpl._privateConstructor();
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
    String searchQuery = 'intitle',
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

  List<BookModel> _parseBooks(Map<String, dynamic> data) {
    return (data['items'] as List)
        .map((item) => BookModel.fromJson(item))
        .toList();
  }
}
