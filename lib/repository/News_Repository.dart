import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/models/News_Channels_Headlines_Model.dart';
import 'package:news_api/models/categories_news_model.dart';

class NewsRepository{

  Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi(String channelName)async{
    String url = "https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=ba041bebfff64ec59e2cef74bf2250a7" ;
    print(url);
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category)async{
    String url = "https://newsapi.org/v2/everything?q=${category}&apiKey=ba041bebfff64ec59e2cef74bf2250a7" ;
    print(url);
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
}