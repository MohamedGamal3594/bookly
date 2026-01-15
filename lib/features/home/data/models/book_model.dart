class BookModel {
  final String title;
  final String author;
  final String? price;
  final String rating;
  final String votes;
  final String imageUrl;
  final String? previewLink;
  final String? downloadLink;

  BookModel.fromJson(Map<String, dynamic> json)
    : title = json['volumeInfo']['title'],
      author = (json['volumeInfo']['authors'] as List).first,
      price = (json['saleInfo']['retailPrice']?['amount'])?.toString(),
      rating = (json['volumeInfo']['averageRating']).toString(),
      votes = (json['volumeInfo']['ratingsCount']).toString(),
      imageUrl =
          json['volumeInfo']['imageLinks']?['thumbnail'] ??
          'https://swmhhs.com/wp-content/uploads/bb-plugin/cache/placeholder-portrait-24ad207fc0543afc3eece959c710b316-.jpg',
      previewLink = json['volumeInfo']['previewLink'],
      downloadLink = json['accessInfo']['pdf']?['downloadLink'];
}
