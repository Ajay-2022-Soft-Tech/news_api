import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_api/models/categories_news_model.dart';

import '../View_Model/News_View_Model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  NewsViewModel newsViewModel = NewsViewModel();


  final format = DateFormat('MMMM dd yyyy');

  String categoryName = 'General';

  List<String> categoriesList = [
    'General',
    'Entertainment',
    'Heath',
    'Sports',
    'Business',
    'Technology'
  ];

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.sizeOf(context).width*1;
    final height = MediaQuery.sizeOf(context).height*1;

    return  Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesList.length,
                  itemBuilder: (context,index){

                  return InkWell(
                    onTap: (){
                      categoryName = categoriesList[index];
                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(

                        decoration: BoxDecoration(
                          color: categoryName == categoriesList[index] ?  Colors.lightBlue : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          child: Center(child: Text(categoriesList[index].toString(), style: GoogleFonts.poppins(
                            fontSize : 13,
                            color : Colors.black,
                          ),)),
                        ),
                      ),
                    ),
                  );
                  },

              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: FutureBuilder<CategoriesNewsModel>(
                future: newsViewModel.fetchCategoriesNewsApi(categoryName),
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
                                    errorWidget: (context, url, error) => Icon(
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
        ),
      ),

    );
  }
}
