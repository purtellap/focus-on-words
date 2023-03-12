import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';

class BooksProvider extends ChangeNotifier {
  List<Book> _books = [];
  List<Book> get books => _books;

  init() async {
    _books = _fetchBooks();
  }

  List<Book> _fetchBooks() {
    return [
      const Book(
        id: '1',
        title: 'Test Book',
        author: 'Author',
        description: 'Description',
      ),
      const Book(
        id: '2',
        title: 'Test Book 2',
        author: 'Author 2',
        description: 'Description 2',
      )
    ];
  }

  static Book? getBookFromId(String id, List<Book> books) {
    try {
      return books.firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }
}
