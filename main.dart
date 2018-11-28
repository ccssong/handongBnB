import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'globals.dart'as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mypage.dart';
import 'main.dart';

Color themecolor = Colors.redAccent;

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    var app = new MaterialApp(
      home: new LoginPage(),
    );

    return app;
  }
}


class LoginPage extends StatefulWidget {

  static final String route = "login-page";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }

}

class LoginPageState extends State<LoginPage>{
  // final Firestore store = Firestore.instance;
  //Color themecolor = Colors.pink[300];


  Future<FirebaseUser> _signIn() async{
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await auth.signInWithGoogle(
        idToken: gSA.idToken,
        accessToken: gSA.accessToken);

    print("user name: ${user.displayName}");
    globals.userName=user.displayName;
    globals.userEmail=user.email;
    globals.userUID=user.uid;
    globals.userpro= user.photoUrl;
    print("user name!!!!!: ${globals.userEmail}");
    print("user name!!!!!: ${globals.userName}");
    print("user name!!!!!: ${globals.userUID}");
    print('user photh!!!!!!!!!!!:  ${globals.userpro}');

    return user;

  }



  Widget HomePage() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: themecolor,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.1), BlendMode.dstATop),
          image: NetworkImage('https://images.pexels.com/photos/291732/pexels-photo-291732.jpeg?cs='
              'srgb&dl=adventure-cold-daylight-291732.jpg&fm=jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 250.0),
            child: Center(
              child: Icon(
                Icons.headset_mic,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HGUBnB",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  "App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    onPressed: () {
                      _signIn().then((FirebaseUser user) {
                        Navigator
                            .of(context)
                            .push(MaterialPageRoute(
                            builder: (BuildContext context) =>Mypage()

                        ))
                            .catchError((e) => print(e));
                      }
                      );
                    },
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "LOGIN WITH GOOGLE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: themecolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          physics: new AlwaysScrollableScrollPhysics(),
          children: <Widget>[HomePage()],
          scrollDirection: Axis.horizontal,
        ));
  }


}
