import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class haberOku extends StatefulWidget {
  haberOku({key, required this.title}) : super(key: key);

  final String title;

  @override
  _haberOkuState createState() => _haberOkuState();
}

class SearchCard extends StatelessWidget {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Arama Yapın...",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            suffixIcon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            hintStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          maxLines: 1,
          controller: _searchControl,
        ),
      ),
    );
  }
}

class _haberOkuState extends State<haberOku> {
  int _index = 0;

  @override
  buildSearchBar(BuildContext context) {
    return PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.0,
          left: 10.0,
          right: 10.0,
        ),
        child: SearchCard(),
      ),
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        60.0,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey),
      body: SingleChildScrollView(
        child: Column(children: [
          PreferredSize(
            child: Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              child: SearchCard(),
            ),
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              60.0,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              Text("Haberler", style: TextStyle(fontSize: 32)),
              SizedBox(width: 100),
              FlatButton(
                  onPressed: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => baskanlikSecimi(title: "")));*/
                  },
                  child: Text("Tümünü Gör(9)",
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey))),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 420, // card height
            child: PageView.builder(
              itemCount: 6,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _index = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _index ? 1 : 0.9,
                  child: Card(
                    color: Colors.blueGrey[100],
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Haber ${i + 1}",
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 40),
        ]),
      ),
    );
  }
}
