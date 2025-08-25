import 'package:dio/dio.dart';
import 'package:news_app/Models/news_post_model.dart';

// String -> json ->articles as List<Map> -> articles as List<obj>
class NewsService {
  NewsService(this.dio);

  final Dio dio;

  Future<List<NewsPost>> getGeneralNews(String category) async {
    // data is String
    
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?apiKey=aef6a6c5487a4957aba48189e968d662&country=us&category=$category',
      );
      // String -> json
      Map<String, dynamic> jsonData = response.data;
      // json -> List
      List<dynamic> myArticles = jsonData['articles'];
      List<NewsPost> myPosts = [];
      //List<Map> -> List<obj>
      for (var article in myArticles) {
        NewsPost newsPost = NewsPost.fromJson(article);
        myPosts.add(newsPost);
      }
      return myPosts;

  }


    Future<List<NewsPost>> searchNews(String q) async {
    // data is String
    
      Response response = await dio.get(
        'https://newsapi.org/v2/everything?apiKey=aef6a6c5487a4957aba48189e968d662&q=$q',
      );
      // String -> json
      Map<String, dynamic> jsonData = response.data;
      // json -> List
      List<dynamic> myArticles = jsonData['articles'];
      List<NewsPost> myPosts = [];
      //List<Map> -> List<obj>
      for (var article in myArticles) {
        NewsPost newsPost = NewsPost.fromJson(article);
        myPosts.add(newsPost);
      }
      return myPosts;

  }
}
