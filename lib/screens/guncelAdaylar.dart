import 'package:flutter/material.dart';
import 'package:login_page_day_23/screens/adayOner.dart';
import 'package:login_page_day_23/screens/girisYaptiniz.dart';

class guncelAdaylar extends StatefulWidget {
  guncelAdaylar({key, required this.title}) : super(key: key);

  final String title;

  @override
  _guncelAdaylarState createState() => _guncelAdaylarState();
}

class _guncelAdaylarState extends State<guncelAdaylar> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Potansiyel Başkanlık Seçimi"),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => girisYaptiniz()));
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
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Başkanlık Aday Önerilerini Destekle",
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.black,
              height: 30,
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 20,
            color: Color(0xFFCFEFE9),
            child: ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/pp.png'),
                radius: 30,
              ),
              title: Text(
                "Ahmet Cevahir ÇINAR",
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text("Konya"),
              trailing: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 40,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.black,
              height: 30,
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 20,
            color: Color(0xFFCFEFE9),
            child: ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/indir.png'),
                radius: 30,
              ),
              title: Text("Berkay Çobanbaş"),
              subtitle: Text("İzmir"),
              trailing: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 40,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.black,
              height: 30,
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 20,
            color: Color(0xFFCFEFE9),
            child: ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/indir.png'),
                radius: 30,
              ),
              title: Text("Damla Yıldız"),
              subtitle: Text("Mersin"),
              trailing: FlatButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.black,
              height: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Yorum Giriniz',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 100, right: 100),
            decoration: BoxDecoration(),
            child: MaterialButton(
              height: 60,
              onPressed: () {},
              color: Colors.blueGrey[300],
              elevation: 0,
              child: Text(
                "Yorum Yap",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 40, right: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
            ),
            child: MaterialButton(
              height: 60,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => adayOner()));
              },
              color: Colors.blueGrey[500],
              elevation: 0,
              child: Text(
                "Başka Bir Aday Öner",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
