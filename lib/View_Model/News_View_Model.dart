
import 'package:news_api/models/News_Channels_Headlines_Model.dart';
import 'package:news_api/models/categories_news_model.dart';
import 'package:news_api/repository/News_Repository.dart';

class NewsViewModel{

  final _rep = NewsRepository();


  Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi(String channelName) async{
    final response = await _rep.fetchNewChannelHeadlinesApi(channelName);
    return response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response;
  }


}