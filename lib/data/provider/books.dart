import 'dart:async';

import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BooksProvider extends ChangeNotifier {
  final String _bonusUrl =
      'https://www.googleapis.com/books/v1/volumes?q=subject:self+help';

  List<Book> _bonusBooks = [];
  List<Book> books = [];

  init() async {
    _bonusBooks = await searchGenre(_bonusUrl);
  }

  List<Book> filterBooks(String query) {
    final List<Book> filteredBooks = [];
    for (Book b in books) {
      if (b.title.contains(query) || b.authors.contains(query)) {
        filteredBooks.add(b);
      }
    }
    return filteredBooks;
  }

  Book? getRandomBook() {
    if (_bonusBooks.isNotEmpty) {
      _bonusBooks.shuffle();
      return _bonusBooks.first;
    }
    return null;
  }

  Future<List<Book>> searchBooks(String query) async {
    debugPrint(query);
    if (query == '') {
      return [];
    }

    try {
      final String url = 'https://www.googleapis.com/books/v1/volumes?q=$query';

      final response = await http.get(Uri.parse(url)).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Unable to establish connetion');
        },
      );

      if (response.statusCode == 200) {
        return _parseBookJson(response.body);
      }
    } catch (e) {
      debugPrint('failure');
    }
    return [];
  }

  List<Book> _parseBookJson(String jsonStr) {
    final jsonMap = convert.json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);

    return jsonList
        .map(
          (jsonBook) => Book(
            id: jsonBook?['id'] ?? '',
            title: jsonBook?['volumeInfo']?['title'] ?? '',
            authors: formatAuthors(jsonBook?['volumeInfo']?['authors']),
            description: jsonBook?['volumeInfo']?['description'] ?? '',
            thumbnail:
                jsonBook?['volumeInfo']?['imageLinks']?['thumbnail'] ?? '',
          ),
        )
        .toList();
  }

  Future<List<Book>> searchGenre(String url) async {
    try {
      final response = await http.get(Uri.parse(url)).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Unable to establish connetion');
        },
      );

      if (response.statusCode == 200) {
        return _parseBookJson(response.body);
      }
    } catch (e) {
      debugPrint('failure');
    }
    return [];
  }

  static Future<Book?> getBookFromId(String id) async {
    try {
      var url = 'https://www.googleapis.com/books/v1/volumes/$id';

      var response = await http.get(Uri.parse(url)).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Unable to establish connetion');
        },
      );

      if (response.statusCode == 200) {
        final jsonBook = convert.json.decode(response.body);
        return Book(
          id: jsonBook?['id'] ?? '',
          title: jsonBook?['volumeInfo']?['title'] ?? '',
          authors: formatAuthors(jsonBook?['volumeInfo']?['authors']),
          description: jsonBook?['volumeInfo']?['description'] ?? '',
          thumbnail: jsonBook?['volumeInfo']?['imageLinks']?['thumbnail'] ?? '',
        );
      }
    } catch (e) {
      debugPrint('failure');
    }
    return null;
  }

  static String formatAuthors(dynamic authors) {
    if (authors == null || authors.isEmpty) {
      return '';
    } else {
      int counter = 0;
      String str = '';
      for (String s in authors) {
        if (counter == 0) {
          str += s;
        } else {
          str += ', $s';
        }
        counter++;
      }
      return str;
    }
  }
}
