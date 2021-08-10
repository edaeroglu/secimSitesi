import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page_day_23/screens/adayOner.dart';
import 'package:login_page_day_23/screens/ileri.dart';
import 'package:login_page_day_23/screens/secimler.dart';

class baskanlikSecimi extends StatefulWidget {
  baskanlikSecimi({key, required this.title}) : super(key: key);

  final String title;

  @override
  _baskanlikSecimiState createState() => _baskanlikSecimiState();
}

class _baskanlikSecimiState extends State<baskanlikSecimi> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Başkanlık Seçimi"),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Secimler()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            elevation: 20,
            color: Colors.blueGrey[400],
            child: ListTile(
              leading: Icon(
                Icons.mail_outline,
                size: 55,
                color: Colors.white,
              ),
              title: Center(
                child: Text(
                  "Türkiye",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              subtitle: Center(
                  child: Text("Başkanlık Seçimi",
                      style: TextStyle(fontSize: 20, color: Colors.white))),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 20,
            color: Colors.blueGrey[300],
            child: ListTile(
              title: Center(
                child: Text(
                  "Seçim Süresi",
                  style: TextStyle(fontSize: 25, color: Colors.grey[200]),
                ),
              ),
              subtitle: Center(
                  child: Text("14.07.2021 00.00-21.07.2021 00.00",
                      style: TextStyle(fontSize: 20, color: Colors.grey[200]))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.black,
              height: 30,
            ),
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Container(
                child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/pp.png'),
              radius: 40.0,
            )),
            Container(
              padding: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(),
              child: MaterialButton(
                height: 60,
                onPressed: () {
                  /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Secimler()));*/
                },
                color: Color(0xFFCFEFE9),
                elevation: 0,
                child: Text(
                  "Ahmet Cevahir ÇINAR",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.grey[700]),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 15,
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Container(
                child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/pp.png'),
              radius: 40.0,
            )),
            Container(
              padding: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(),
              child: MaterialButton(
                height: 60,
                onPressed: () {
                  /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Secimler()));*/
                },
                color: Color(0xFFCFEFE9),
                elevation: 0,
                child: Text(
                  "Ahmet Cevahir ÇINAR",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.grey[700]),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 15,
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Container(
                child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/pp.png'),
              radius: 40.0,
            )),
            Container(
              padding: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(),
              child: MaterialButton(
                height: 60,
                onPressed: () {
                  /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Secimler()));*/
                },
                color: Color(0xFFCFEFE9),
                elevation: 0,
                child: Text(
                  "Ahmet Cevahir ÇINAR",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.grey[700]),
                ),
              ),
            ),
          ]),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 45, right: 40),
            decoration: BoxDecoration(),
            child: MaterialButton(
              height: 60,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Ileri()));
              },
              color: Colors.blueGrey[300],
              elevation: 0,
              child: Text(
                "İleri",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(),
              child: MaterialButton(
                height: 60,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => adayOner()));
                },
                color: Colors.blueGrey[300],
                elevation: 0,
                child: Text(
                  "Aday Öner",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(),
              child: MaterialButton(
                height: 60,
                onPressed: () {
                  /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Secimler()));*/
                },
                color: Colors.blueGrey[300],
                elevation: 0,
                child: Text(
                  "Geçmiş Seçimler",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
