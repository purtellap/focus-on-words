import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/data/provider/books.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<String> _favoriteIds = [];
  List<Book> favoriteBooks = [];

  Future<void> getFavoriteBooks() async {
    for (String s in _favoriteIds) {
      _addBook(s);
    }
  }

  init() async {
    await getFavoriteBooks();
  }

  /// Check if favorite
  bool isFavorite(String id) {
    return _favoriteIds.contains(id);
  }

  /// Add/remove favorite
  void favorite(String id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
      favoriteBooks.removeWhere((e) => e.id == id);
    } else {
      _favoriteIds.add(id);
      _addBook(id);
    }
    notifyListeners();
  }

  Future<void> _addBook(String id) async {
    Book? book = await BooksProvider.getBookFromId(id);
    if (book != null) {
      favoriteBooks.insert(0, book);
    }
  }
}
