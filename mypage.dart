import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'globals.dart' as globals;
import "ListItem.dart";
import "dart:async";
import "favorite.dart";
import "hosting.dart";

class Mypage extends StatefulWidget {
  @override
  MypageState createState() => new MypageState();
}

class MypageState extends State<Mypage> {
  double _imageHeight = 400.0;


   Future<LoginPage>  _signOut()  async{
    await auth.signOut();
   return new LoginPage();
  }


  @override
  void initState() {
    super.initState();
  }

  List<ListItem> items = [
    new ListItem(title: "Logout", icon: Icons.input),
    new ListItem(title: "저장 목록", icon: Icons.favorite_border),
    new ListItem(title: "호스팅 페이지", icon: Icons.home),
  ];

  Widget _buildIamge() {
    return Container(
        width: 600.0,
        height: _imageHeight,
        child: Image.network(
         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdSM_owS0fa3G4gepUSDEucR0UHai1p63pCFmU-00AMzSZLaK9',
          fit: BoxFit.fitWidth,
          colorBlendMode: BlendMode.srcOver,
          color: new Color.fromARGB(120, 20, 10, 40),
        ));
  }

  Widget _buildProfileRow() {
    return new Padding(
      padding:
          new EdgeInsets.only(left: 20.0, right: 10.0, top: _imageHeight / 2.5),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            minRadius: 40.0,
            maxRadius: 40.0,
            backgroundImage: new NetworkImage(globals.userpro),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  globals.userEmail,
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10.0),
                new Text(
                  globals.userName,
                  style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildBottomPart() {
    return new Padding(
      padding: new EdgeInsets.only(top: _imageHeight - 20),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMyTasksHeader(),
          SizedBox(height: 10.0),
          _buildTasksList(),
        ],
      ),
    );
  }

//TODO
  Widget _buildTasksList() {
    return new Expanded(
        child: Container(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child:
                /* new ListView(
        children: items.map((item) => new ListItem(title: item.title, icon:item.icon)).toList(),
      ),*/
                ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                if(index == 0){
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                      child: Column(children: <Widget>[
                        ListTile(
                            title: Text(
                              item.title,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            trailing: Icon(item.icon),
                            onTap:
                                () =>
                                _signOut().then((LoginPage loginPage) {
                                  Navigator
                                      .of(context)
                                      .push(MaterialPageRoute(
                                      builder: (BuildContext context) => LoginPage()
                                  ));
                                })

                        ),
                        SizedBox(height: 10.0),
                        Divider(height:5.0)
                      ]));
                }
                else if(index == 1){
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                      child: Column(children: <Widget>[
                        ListTile(
                            title: Text(
                              item.title,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            trailing: Icon(item.icon),
                            onTap: () =>
                                  Navigator
                                      .of(context)
                                      .push(MaterialPageRoute(
                                      builder: (BuildContext context) => FavoriteList()
                                  ))


                        ),
                        SizedBox(height: 10.0),
                        Divider(height:5.0)
                      ]));
                }
                else if(index == 2){
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                      child: Column(children: <Widget>[
                        ListTile(
                            title: Text(
                              item.title,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            trailing: Icon(item.icon),
                            onTap: () =>  Navigator
                                .of(context)
                                .push(MaterialPageRoute(
                                builder: (BuildContext context) => HostingPage()
                            ))

                        ),
                        SizedBox(height: 10.0),
                        Divider(height:5.0)
                      ]));
                }
              },
            )));
  }

  Widget _buildMyTasksHeader() {
    return new Padding(
      padding: new EdgeInsets.only(left: 30.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            'My Page',
            style: new TextStyle(fontSize: 34.0),
          ),
          new Text(
            'Welcome To My Page',
            style: new TextStyle(color: Colors.grey, fontSize: 15.0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("DeepPurple")),
        body: SafeArea(
            child: Row(children: <Widget>[
      Expanded(
        child: Stack(
          children: <Widget>[
            _buildIamge(),
            _buildProfileRow(),
            _buildBottomPart(),
          ],
        ),
      )
      //_buildFab()
    ])));
  }
}
