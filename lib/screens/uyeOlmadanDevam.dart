import 'package:flutter/material.dart';
import 'package:login_page_day_23/screens/hosgeldiniz.dart';
import 'package:login_page_day_23/screens/pickOrDropdown.dart';

class uyeOlmadanDevamSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Hosgeldiniz()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '''Eğer üye değilsen bunları deneyebilirsin;''',
                    style: TextStyle(
                      fontFamily: 'Caveat',
                      fontSize: 33,
                      color: Colors.black,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pickOrDropdown()));
                      },
                      color: Colors.yellow[600],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Üye Olmadan Konumla Oy Ver",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.brown[400]),
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pickOrDropdown()));
                      },
                      color: Colors.yellow[600],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Üye Olmadan Konumla Ankete Katıl",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.brown[400]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pickOrDropdown()));
                      },
                      color: Colors.yellow[600],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Üye Olmadan Konumla Haber Oku",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.brown[400]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/vote16.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
