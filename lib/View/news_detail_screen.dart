import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_api/View/Home_Screen.dart';

class NewsDetailScreen extends StatefulWidget {

  final String newsImage , newsTitle , newsDate , author , description, content , source;

  const NewsDetailScreen({super.key,
    required this.newsImage ,
    required this.newsTitle ,
    required this.newsDate,
    required this.description,
    required this.content,
    required this.source ,
    required this.author});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final format = DateFormat('MMMM dd YYYY');

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.sizeOf(context).width*1;
    final height = MediaQuery.sizeOf(context).height*1;

    DateTime dateTime = DateTime.parse(widget.newsDate);

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
          icon: Icon(Icons.arrow_back),

        ),
      ),
      body: Stack(
        children: [
          Container(
            height: height* .45,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.newsImage,
                fit: BoxFit.cover,
                placeholder: (context, ulr) => Center(child: CircularProgressIndicator(),),

              ),
            ),
          ),
          Container(
            height: height*.6,
            margin: EdgeInsets.only(top: height*.4),
            padding: EdgeInsets.only(top: 20,right: 20,left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
              ),
              color: Colors.white,
            ),
            child: ListView(
              children: [
                Text(widget.newsTitle,style: GoogleFonts.poppins(fontSize : 20, color: Colors.black87 , fontWeight : FontWeight.w700),),
                SizedBox(height: height*.02,),
                Row(

                  children: [
                    Expanded(child: Text(widget.source,style: GoogleFonts.poppins(fontSize : 13, color: Colors.black54 , fontWeight : FontWeight.w600))),
                    Text(format.format(dateTime),style: GoogleFonts.poppins(fontSize : 12, color: Colors.black54 , fontWeight : FontWeight.w500)),
                  ],
                ),
                SizedBox(height: height*.03,),
                Text(widget.description,style: GoogleFonts.poppins(fontSize : 15, color: Colors.black54 , fontWeight : FontWeight.w500)),


              ],
            ),
          )
        ],
      ),

    );
  }
}
