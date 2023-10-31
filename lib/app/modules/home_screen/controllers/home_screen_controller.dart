import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/app/modules/home_screen/model/books.dart';

class HomeScreenController extends GetxController {
  var booksList = <Book>[].obs;

  @override
  void onInit() {
    super.onInit();
    ambilData();
  }

  Future<void> ambilData() async {
    var response = await http.get(Uri.parse(
        "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=sWjaytP0HLL6rPPZzY2XFsJRTxf1gO7a"));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      Books book = Books.fromJson(jsonData);

      booksList.assignAll(book.results.books);
    } else {
      throw Exception("error when request data");
    }
  }
}
