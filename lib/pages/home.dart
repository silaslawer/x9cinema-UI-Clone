import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:x9cinema/pages/movie_series_detail.dart';
import 'package:x9cinema/utils/colors.dart';
import 'package:x9cinema/utils/strings.dart';
import 'package:x9cinema/widgets/select_chip.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> reportList = ["Recommended", "Netflix", "HBOGO", "Amazon", "Disney+","Hulu","AppleTV"];
  List movieList = [
    {
      "title": "DRIVE",
      "leadActor": "Ryan Gosling",
      "poster": "assets/images/x9cinema-poster-drive.jpg",
      "rating": 4.5,
      "type": "Action",
      "length": "1h 58m",
      "cast": [{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },],
    },
    {
      "title": "MAD MAX",
      "leadActor": "FURY ROAD",
      "poster": "assets/images/x9cinema-poster-madmax.jpg",
      "rating": 3.5,
      "type": "Action",
      "length": "1h 58m",
      "cast": [{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },],
    },
  ];

  List seriesList = [
    {
      "title": "MONEY HEIST",
      "leadActor": "BELLA CIAO",
      "poster": "assets/images/x9cinema-moneyheist.png",
      "rating": 2.0,
      "type": "Action",
      "length": "1h 58m",
      "cast": [{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },],
    },
    {
      "title": "MONEY HEIST",
      "leadActor": "BELLA CIAO",
      "poster": "assets/images/x9cinema-witcher.jfif",
      "rating": 2.0,
      "type": "Action",
      "length": "1h 58m",
      "cast": [{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },{
        "url": "",
      },],
    },
  ];
  String selectedReportList;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(colorGray),
      appBar: AppBar(
        title: RichText(
            text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: appBarTitle1,style: TextStyle(fontSize: 20,fontFamily: 'Proxima Nova',fontWeight: FontWeight.bold,color: Color(colorBlack))
            ),
            TextSpan(
                text: appBarTitle2, style: TextStyle(fontSize: 20,fontFamily: 'Raleway',color: Color(colorBlack))),
          ],
        )),elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Feather.search),tooltip: 'search',
            onPressed: () {
              print('search');
            },
          ),
          IconButton(
            icon: Icon(Feather.align_right),tooltip: 'menu',
            onPressed: () {
              print('menu');
            },
          )
        ],
      ),
      body: Container(margin: EdgeInsets.only(left: 15,right: 15),child: SingleChildScrollView(child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            child: SelectChip(
              reportList,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
            ),),
        SizedBox(height: 30,),
        Container(alignment: Alignment.centerLeft,child: Text("Movies",style: TextStyle(fontSize: 20,fontFamily: 'Proxima Nova',fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),
        SizedBox(height: 15,),
        buildMovieSeriesCard(movieList),
        SizedBox(height: 30,),
        Container(alignment: Alignment.centerLeft,child: Text("Series",style: TextStyle(fontSize: 20,fontFamily: 'Proxima Nova',fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),
        SizedBox(height: 15,),
        buildMovieSeriesCard(seriesList),
        SizedBox(height: 30,),
      ],),),),
      bottomNavigationBar: Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Icon(MaterialCommunityIcons.movie_roll,color: _selectedIndex == 0 ?  Color(colorRed) : Color(colorGray),),
            ),
          ),
          /*Container(child: VerticalDivider(color: Colors.red,endIndent: 20,indent: 20,),),*/
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _selectedIndex = 1;
                });
                print("Invest Button");
              },
              child: Icon(Fontisto.fire,color: _selectedIndex == 1 ?  Color(colorRed) : Color(colorGray),),
            ),
          ),
        //  Container(child: VerticalDivider(color: Colors.red,endIndent: 20,indent: 20,),),
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _selectedIndex = 2;
                });
                // navigateToOneTImeDash(context);
              },
              child: Icon(Icons.bookmark,color: _selectedIndex == 2 ?  Color(colorRed) : Color(colorGray),),
            ),
          ),
         // Container(child: VerticalDivider(color: Colors.red,endIndent: 20,indent: 20,),),
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _selectedIndex = 3;
                });
                // navigateToOneTImeDash(context);
              },
              child:  Icon(Icons.person,color: _selectedIndex == 3 ?  Color(colorRed) : Color(colorGray),),
            ),
          ),
        ],
      ),
    ),
    );
  }

  buildMovieSeriesCard(List itemList){
    return Container( height: MediaQuery.of(context).size.height /
        2,child: ListView.builder(
        shrinkWrap: true,
        //   controller: ScrollController(),
        itemCount:
        itemList == null ? 0: itemList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (BuildContext context, int position) {
          return GestureDetector(
            onTap: () {
              navigateToDetails(context,itemList[position]);
            },
            child: Container(
              width:
              MediaQuery.of(context).size.width /
                  1.5,
              margin: EdgeInsets.only(
                  right: 20.0, bottom: 5.0),
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(itemList[position]['poster']),fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),topRight: Radius.circular(30)),
                  color: Colors.red),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Icon(AntDesign.ellipsis1,color: Color(colorWhite),size: 30,),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      width: MediaQuery.of(context)
                          .size
                          .width /
                          2,
                      //padding: EdgeInsets.only(left: 20),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
                        Text(
                          "${itemList[position]['title']}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 50,fontFamily: 'Proxima Nova',fontWeight: FontWeight.bold,
                              color: Color(colorWhite)),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "${itemList[position]['leadActor']}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20,fontFamily: 'Proxima Nova',fontWeight: FontWeight.bold,
                              color: Color(colorWhite)),
                        ),
                        SizedBox(height: 10,),
                        RatingBar(
                          initialRating: itemList[position]['rating'],unratedColor: Color(colorGray),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(colorWhite),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ],),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Icon(FontAwesome.bookmark,color: Color(colorWhite),size: 30,),
                  ),
                ],
              ),
            ),
          );
        }),);
  }

  navigateToDetails(BuildContext context, var item){
    Navigator.push(context, CupertinoPageRoute(builder: (context)=>MovieSeriesDetail(item)));
  }
}
