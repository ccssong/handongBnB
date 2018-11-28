import 'package:flutter/material.dart';
import 'main.dart';

class FavoriteItem extends StatefulWidget {
  final String name;
  final String location;
  final String type;
  final String cost;
  final String url;

  FavoriteItem({this.name, this.location, this.type, this.cost, this.url});

  FavoriteItemState createState() => new FavoriteItemState();
}

class FavoriteItemState extends State<FavoriteItem> {
  Widget _Image() {
    return Container(
        width: 470.0,
        child: Image.network(
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXtSFkG4W7-fKfR2Ti2DtLz4jzDr6Prjwyl7y91lKJgXwa_bnTgQ",
          //widget.url,
          fit: BoxFit.fitWidth,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("go to detail page\n"),
     child:  Padding(
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _Image(),
            SizedBox(height: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Text(
                      widget.type,
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: themecolor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 10.0),
                    new Text(widget.location,
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: themecolor,
                            fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox(height: 5.0),
                new Text(
                  widget.name,
                  style: new TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                new Text(
                  widget.cost,
                  style: new TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ],
            )
          ]),
    )
    );
  }
}
