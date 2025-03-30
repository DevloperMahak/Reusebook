import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book.dart';

class FavoritesController extends GetxController {
  var favoriteBooks = <Book>[].obs;
  List<Book> _allBooks = [];

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void setAllBooks(List<Book> books) {
    _allBooks = books;
    loadFavorites(); // Load favorites when all books are set
  }

  void addToFavorites(Book book) {
    if (!favoriteBooks.contains(book)) {
      favoriteBooks.add(book);
      saveFavorites();
    }
  }

  void removeFromFavorites(Book book) {
    favoriteBooks.remove(book);
    saveFavorites();
  }

  bool isFavorite(Book book) {
    return favoriteBooks.contains(book);
  }

  void saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    // Save book names as a list
    final favList = favoriteBooks.map((book) => jsonEncode(book.toJson())).toList();
    prefs.setStringList('favorite_books', favList);
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList('favorite_books') ?? [];

    // You need to get the full list of books from somewhere
    List<Book> loadedFavorites = favList.map((b) {
      final decoded = jsonDecode(b);
      return Book.fromJson(decoded);
    }).toList();

    favoriteBooks.value = loadedFavorites;
  }
}
