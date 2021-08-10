import 'package:flutter/material.dart';
import 'package:login_page_day_23/screens/girisYaptiniz.dart';

class Ileri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          "Tebrikler",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          '''Oy Verme Islemi Tamamlanmıstır!
                        
Seçim sonuçları 21/07/2021
23.59’da uygulama üzerinden
açıklanacaktır ve oy veren üyelere
bildirim gönderilecektir.

Kalan Süre: 4 gün 15 saat 27 dk 3 sn
''',
                          style: TextStyle(
                            fontFamily: 'Merienda',
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 3.7,
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/tbrk.png'),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 45, right: 40),
                      decoration: BoxDecoration(),
                      child: MaterialButton(
                        height: 60,
                        onPressed: () {
                          /*Navigator.push(
                context, MaterialPageRoute(builder: (context) => ()));*/
                        },
                        color: Colors.yellow[200],
                        elevation: 0,
                        child: Text(
                          "Seçimi Paylaş",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 25, bottom: 40),
                          decoration: BoxDecoration(),
                          child: MaterialButton(
                            height: 60,
                            onPressed: () {
                              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ()));*/
                            },
                            color: Colors.yellow[200],
                            elevation: 0,
                            child: Text(
                              "Geçmiş Seçimler",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 25, bottom: 40),
                          decoration: BoxDecoration(),
                          child: MaterialButton(
                            height: 60,
                            onPressed: () {
                              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ()));*/
                            },
                            color: Colors.yellow[200],
                            elevation: 0,
                            child: Text(
                              "Tüm Seçimler",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
