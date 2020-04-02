import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:x9cinema/utils/colors.dart';
import 'package:x9cinema/utils/strings.dart';
import 'package:x9cinema/widgets/select_chip.dart';

class MovieSeriesDetail extends StatefulWidget {
  final item;
  MovieSeriesDetail(this.item);

  @override
  _MovieSeriesDetailState createState() => _MovieSeriesDetailState();
}

class _MovieSeriesDetailState extends State<MovieSeriesDetail> {
  int _selectedIndex = 0;

  var item;
  @override
  void initState() {
    super.initState();

    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colorGray),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 15),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Color(colorBlack),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: RichText(
                              text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${item['title']} - ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Proxima Nova',
                                      color: Color(colorBlack))),
                              TextSpan(
                                  text: item['leadActor'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Raleway',
                                      color: Color(colorBlack))),
                            ],
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.3,
                  margin: EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              item['poster']),
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.contain),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: Colors.red),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Icon(
                          AntDesign.ellipsis1,
                          color: Color(colorWhite),
                          size: 30,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            //padding: EdgeInsets.only(left: 20),
                            child: RatingBar(
                              initialRating: item['rating'],
                              unratedColor: Color(colorGray),
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
                            )),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  child: Text(
                                    item['length'],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              )),
                              Container(
                                  width: 50,
                                  child: Divider(
                                    height: 20,
                                    color: Color(colorGray),
                                  )),
                              Container(
                                  child: Text(
                                    item['type'],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              )),
                              Container(
                                  width: 50,
                                  child: Divider(
                                    height: 20,
                                    color: Color(colorGray),
                                  )),
                              Container(
                                  child: Text(
                                    "${item['rating']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              )),
                              Container(
                                  width: 50,
                                  child: Divider(
                                    height: 20,
                                    color: Color(colorGray),
                                  )),
                              Container(
                                  child: Icon(
                                Icons.bookmark,
                                color: Color(colorBlack),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Container(
                          height: 10,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width:50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all( Radius.circular(30)),
                                    color: Colors.white),),
                              SizedBox(width: 10,),
                              Container(

                                  child: CircleAvatar(backgroundColor: Color(colorWhite),radius: 5,)),
                              SizedBox(width: 10,),
                              Container(

                                  child: CircleAvatar(backgroundColor: Color(colorWhite),radius: 5,)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Synosis",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      synopsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                      textAlign: TextAlign.start,
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Cast",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    )),
                SizedBox(
                  height: 30,
                ),
                buildCastCard(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Icon(
                  MaterialCommunityIcons.movie_roll,
                  color:
                      _selectedIndex == 0 ? Color(colorRed) : Color(colorGray),
                ),
              ),
            ),
            /*Container(child: VerticalDivider(color: Colors.red,endIndent: 20,indent: 20,),),*/
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Icon(
                  Fontisto.fire,
                  color:
                      _selectedIndex == 1 ? Color(colorRed) : Color(colorGray),
                ),
              ),
            ),
            //  Container(child: VerticalDivider(color: Colors.red,endIndent: 20,indent: 20,),),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  // navigateToOneTImeDash(context);
                },
                child: Icon(
                  Icons.bookmark,
                  color:
                      _selectedIndex == 2 ? Color(colorRed) : Color(colorGray),
                ),
              ),
            ),
            // Container(child: VerticalDivider(color: Colors.red,endIndent: 20,indent: 20,),),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  // navigateToOneTImeDash(context);
                },
                child: Icon(
                  Icons.person,
                  color:
                      _selectedIndex == 3 ? Color(colorRed) : Color(colorGray),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCastCard() {
    return Container(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: item['cast'] == null ? 0 : item['cast'].length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector(
              onTap: () {
                /*   navigateToDetails(context,
                      snapshot.data.documents[position]);*/
              },
              child: Container(
                width: 100,
                margin: EdgeInsets.only(right: 20.0, bottom: 5.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            item['cast'][position]['url']),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.red),
              ),
            );
          }),
    );
  }
}
