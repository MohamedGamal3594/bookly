import 'package:bookly/core/utils/result.dart';
import 'package:bookly/features/home/data/models/book_model.dart';

abstract class HomeRepo {
  Future<Result<List<BookModel>>> fetchNewBooks();
  Future<Result<List<BookModel>>> fetchRelevantBooks({
    String searchQuery = 'intitle',
  });
}
