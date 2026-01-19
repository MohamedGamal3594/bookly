import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/result.dart';
import 'package:bookly/features/home/data/models/book_model.dart';

abstract class HomeRepo {
  Future<Result<List<BookModel>>> fetchNewBooks();
  Future<Result<List<BookModel>>> fetchRelevantBooks({
    String searchQuery = AppConstants.defaultQuery,
  });
  Future<Result<List<BookModel>>> fetchAuthorBooks({
    required String authorName,
  });
}
