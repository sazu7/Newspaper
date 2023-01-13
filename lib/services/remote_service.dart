import 'dart:convert';
import 'package:http/http.dart' as http;


import '../model/news.dart';

class RemoteService {
  Future<News?> getNews() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2023-01-10&to=2023-01-10&sortBy=popularity&apiKey=8a7cda10e79e4d51bdfaf49e746f9464');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return News.fromJson(data);
      // var articles = data['articles'];
      // print(articles);
    } else {
      return null;
    }
  }
}
