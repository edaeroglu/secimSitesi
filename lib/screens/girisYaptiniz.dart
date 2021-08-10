import 'package:flutter/material.dart';
import 'package:login_page_day_23/screens/adayOl.dart';
import 'package:login_page_day_23/screens/anketeKatil.dart';
import 'package:login_page_day_23/screens/girisYap.dart';
import 'package:login_page_day_23/screens/guncelAdaylar.dart';
import 'package:login_page_day_23/screens/haberOku.dart';
import 'package:login_page_day_23/screens/profilEk.dart';
import 'package:login_page_day_23/screens/secimler.dart';

class girisYaptiniz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Color(0xFF585F65),
          title: Text(
            "Hoşgeldiniz! ",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => girisYapSayfasi()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 38,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => profilEk()));
              },
            ),
          ],
        ),
        body: SafeArea(
            child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                '''Hangisini
yapmak
istediginizi 
seçiniz''',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.blueGrey[100],
                    fontFamily: "Merienda"),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(width: 10),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Secimler()));
                    },
                    child: Card(
                      elevation: 20,
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SizedBox(
                          width: 150,
                          height: 120,
                          child: Center(
                            child:
                                Text('Oy Ver', style: TextStyle(fontSize: 20)),
                          )),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => anketeKatil()));
                    },
                    child: Card(
                        elevation: 20,
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SizedBox(
                          width: 150,
                          height: 120,
                          child: Center(
                              child: Text('Ankete Katıl',
                                  style: TextStyle(fontSize: 20))),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => haberOku(title: "")));
                    },
                    child: Card(
                        elevation: 20,
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SizedBox(
                          width: 150,
                          height: 120,
                          child: Center(
                              child: Text('Haber Oku',
                                  style: TextStyle(fontSize: 20))),
                        )),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => guncelAdaylar(title: "")));
                    },
                    child: Card(
                        elevation: 20,
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SizedBox(
                          width: 150,
                          height: 120,
                          child: Center(child: Text('''Güncel Adaylara
         Oy Ver''', style: TextStyle(fontSize: 20))),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => adayOl()));
                  },
                  child: Card(
                      elevation: 20,
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SizedBox(
                        width: 180,
                        height: 120,
                        child: Center(
                            child: Text('Aday Ol',
                                style: TextStyle(fontSize: 20))),
                      )),
                ),
              ),
            ],
          )),
        )));
  }
}
/*Container(
                                padding: EdgeInsets.only(top: 10, left: 100, right: 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 60,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Secimler()));
                                  },
                                  color: Colors.cyan[800],
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    "Oy Ver",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ),
                              ),*/

/*import 'package:flutter/material.dart';
import 'package:login_page_day_23/screens/secimler.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'baskanlikSecimi.dart';

class girisYaptiniz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Oy Ver",
      "Ankete Katıl",
      "Haber Oku",
      "Güncel Adaylara Oy Ver",
      "Aday Ol",
    ];

    List<Widget> images = [
      Card(
        color: Colors.red,
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Secimler()));
          },
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => baskanlikSecimi(title: "")));
        },
        child: Container(
          color: Colors.yellow,
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => baskanlikSecimi(title: "")));
        },
        child: Container(
          color: Colors.black,
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => baskanlikSecimi(title: "")));
        },
        child: Container(
          color: Colors.cyan,
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => baskanlikSecimi(title: "")));
        },
        child: Container(
          color: Colors.yellow,
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Giris"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                    titles: titles,
                    // required
                    images: images,
                    // required
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    // optional
                    onPageChanged: (page) {
                      // optional
                    },
                    onSelectedItem: (index) {
                      // optional
                    },
                    initialPage: 0,
                    // optional
                    align: ALIGN.CENTER // optional
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
