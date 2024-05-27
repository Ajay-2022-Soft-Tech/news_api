import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_api/View/categories_screen.dart';
import 'package:news_api/View/news_detail_screen.dart';
import 'package:news_api/View_Model/News_View_Model.dart';
import 'package:news_api/models/News_Channels_Headlines_Model.dart';

import '../models/categories_news_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum FilterList {bbcNews , aryNews , bbcSports , independent , reuters, cnn, alJazeera}

class _HomeScreenState extends State<HomeScreen> {

  FilterList? selectedMenu;
  // initialize news view model
  NewsViewModel newsViewModel = NewsViewModel();


  final format = DateFormat('MMMM dd YYYY');

  String name = 'bbc-news';

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.sizeOf(context).width*1;
    final height = MediaQuery.sizeOf(context).height*1;

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesScreen()));
          },
          icon: Image.asset('images/category_icon.png',
            height: 20,
            width: 20,
          ),

        ),
        actions: [
          PopupMenuButton<FilterList>(
            initialValue: selectedMenu,
              icon: Icon(Icons.more_vert,color: Colors.black ),
              onSelected: (FilterList item){
                  if (FilterList.bbcNews == item){
                    name = 'bbc-news';
                  }
                  if (FilterList.bbcSports == item){
                    name ='bbc-sport';
                  }
                  if (FilterList.alJazeera == item){
                    name ='al-jazeera-english';
                  }

                  setState(() {
                    selectedMenu = item;

                  });
              },
              itemBuilder: (context) => <PopupMenuEntry<FilterList>> [
                const PopupMenuItem<FilterList>(
                  value: FilterList.bbcNews,
                    child: Text('BBC News')),
                const PopupMenuItem<FilterList>(
                    value: FilterList.bbcSports,
                    child: Text('Sports News')),
                const PopupMenuItem<FilterList>(
                    value: FilterList.alJazeera,
                    child: Text('Al-Jezeera News'))

              ])
        ],
        centerTitle: true,  
        title: Text("News" , style: GoogleFonts.poppins(fontSize: 24, fontWeight : FontWeight.w700),),

      ),
      body: ListView(
        children: [
          SizedBox(
            height:height*0.55,
            width: width,
            child: FutureBuilder<NewsChannelsHeadlinesModel>(
              future: newsViewModel.fetchNewChannelHeadlinesApi(name),
              builder: (BuildContext context , snapshot){

                if (snapshot.connectionState == ConnectionState.waiting){

                  return Center(
                    child: SpinKitCircle(
                      size: 40,
                      color: Colors.lightBlue,
                    ),
                  );
                }
                else{
                  return ListView.builder(
                  itemCount: snapshot.data!.articles!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index ) {

                    DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                        return InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>
                                NewsDetailScreen(
                                    newsImage: snapshot.data!.articles![index].urlToImage.toString()
                                    , newsTitle: snapshot.data!.articles![index].title.toString()
                                    , newsDate: snapshot.data!.articles![index].publishedAt.toString(),
                                    description: snapshot.data!.articles![index].description.toString(),
                                    content: snapshot.data!.articles![index].content.toString(),
                                    source: snapshot.data!.articles![index].source!.name.toString(),
                                    author: snapshot.data!.articles![index].author.toString())
                            ));
                          },
                          child: SizedBox(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: height*0.6,
                                  width: width*0.99,
                                  padding: EdgeInsets.symmetric(horizontal: height*.02),
                          
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25)
                                    ,
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data!.articles![index]
                                          .urlToImage.toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Container(
                                            child: spinKit2,
                                    
                                          ),
                                      errorWidget: (context, url, error) => Icon(
                                        Icons.error_outline, color: Colors.red,),
                                    
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  child: Card(
                                    elevation: 15,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(15.0),
                                      alignment: Alignment.bottomCenter,
                                      height: height*0.22,
                                      width: width*0.75,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width* 0.7,
                                            child: Text(snapshot.data!.articles![index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize:17 , fontWeight :FontWeight.w700),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: width*0.7,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                  Text(snapshot.data!.articles![index].source!.name.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize:13 , fontWeight :FontWeight.w600),),
                                                  Text(format.format(dateTime),maxLines: 2,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize:12 , fontWeight :FontWeight.w500),),
                                              ],
                                            ),
                                          )
                          
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                          
                          
                              ],
                            ),
                          
                          ),
                        );
                      }
                        );

              };
              },
          )
      ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder<CategoriesNewsModel>(
              future: newsViewModel.fetchCategoriesNewsApi('General'),
              builder: (BuildContext context , snapshot){

                if (snapshot.connectionState == ConnectionState.waiting){

                  return const Center(
                    child: SpinKitCircle(
                      size: 40,
                      color: Colors.lightBlue,
                    ),
                  );
                }
                else{
                  return ListView.builder(
                      itemCount: snapshot.data!.articles!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context , index ) {

                        DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(

                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25)
                                ,
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                  fit: BoxFit.cover,
                                  height: height*.18,

                                  width: width*.3,
                                  placeholder: (context, url) =>
                                      Container(
                                        child: const Center(
                                          child: SpinKitCircle(
                                            size: 40,
                                            color: Colors.lightBlue,
                                          ),
                                        ),

                                      ),
                                  errorWidget: (context, url, error) => const Icon(
                                    Icons.error_outline, color: Colors.red,),

                                ),
                              ),
                              Expanded(
                                  child: Container(
                                    height: height* .18,
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: [
                                        Divider(color: Colors.lightBlue,),

                                        Text(snapshot.data!.articles![index].title.toString(),
                                            maxLines: 3,
                                            style: GoogleFonts.poppins(
                                              fontSize : 15,
                                              color : Colors.black54,
                                              fontWeight : FontWeight.w600,

                                            )),

                                        Spacer(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(snapshot.data!.articles![index].source!.name.toString(),
                                                style: GoogleFonts.poppins(
                                                  fontSize : 10,
                                                  color : Colors.lightBlue,
                                                  fontWeight : FontWeight.w600,

                                                )),
                                            Text(format.format(dateTime),
                                                maxLines: 3,
                                                style: GoogleFonts.poppins(
                                                  fontSize : 13,
                                                  fontWeight : FontWeight.w500,

                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                            ],

                          ),

                        );
                      }
                  );

                };
              },
            ),
          )
      ],

    )
    );
}
  static const spinKit2 = SpinKitFadingCircle(
    color: Colors.amber,
    size: 50,
  );
  }
