import 'package:flutter/material.dart';
import 'package:login_page_day_23/screens/girisYap.dart';
import 'package:login_page_day_23/screens/girisYaptiniz.dart';
import 'package:login_page_day_23/screens/sifreDegistir.dart';

import 'profilEkranı.dart';
import 'profilMenu.dart';
import 'profilResmi.dart';

class profilEk extends StatelessWidget {
  @override
  static String routeName = "/profile";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profil"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => girisYaptiniz()));
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            //SizedBox(height: 40),
            profilResmi(),
            SizedBox(height: 50),
            Text('''Ad Soyad
Doğum Tarihi
Yaşadığı yer'''),
            SizedBox(height: 50),
            profilMenu(
              text: "Profili Düzenle",
              icon: "assets/icons/User Icon.svg",
              press: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profilEkrani()))
              },
            ),
            profilMenu(
              text: "Bildirimler",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            profilMenu(
              text: "Şifre Değiştir",
              icon: "assets/icons/Lock.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sifreDegistir()));
              },
            ),
            /*profilMenu(
              text: "Ayarlar",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            profilMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),*/
            profilMenu(
              text: "Çıkış Yap",
              icon: "assets/icons/Log out.svg",
              press: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        backgroundColor: Colors.white,
                        title: new Text(
                            "Çıkış yapmak istediğinizden emin misiniz?"),
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            girisYapSayfasi()));
                              },
                              child: Text("Evet")),
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Hayır"))
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
