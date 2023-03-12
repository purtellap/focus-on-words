import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/data/provider/books.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favorites = [];

  List<Book> favoriteBooks(List<Book> allBooks) {
    List<Book> favoriteBooks = [];
    for (String s in _favorites) {
      Book? book = BooksProvider.getBookFromId(s, allBooks);
      if (book != null) {
        favoriteBooks.add(book);
      }
    }
    return favoriteBooks;
  }

  init() async {
    _favorites = _getFavorites();
  }

  List<String> _getFavorites() {
    return [];
  }

  /// Check if favorite
  bool isFavorite(String id) {
    return _favorites.contains(id);
  }

  /// Add/remove favorite
  void favorite(String id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
  }
}
