import 'package:flutter/material.dart';
import 'package:login_page_day_23/screens/girisYaptiniz.dart';

class adayOl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          "Aday Ol ",
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
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            Text(
              '''          Aday Olmak ve 
    Kendinizi Tanıtmak Mı
        İstiyorsunuz?''',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.blueGrey[300],
                  fontFamily: "Caveat"),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: "           Adınız-Soyadınız",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: DropdownButton<String>(
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 17,
                  ),
                  underline: SizedBox(),
                  hint: Center(
                    child: Center(
                        child: Text('   Siyasi Partiniz',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.8))),
                  ),
                  iconEnabledColor: Colors.blueGrey,
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  onChanged: (String? newValue) {},
                  items: <String>['AKP', 'MHP', 'CHP', 'İyi Parti', 'HDP']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: DropdownButton<String>(
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 17,
                  ),
                  underline: SizedBox(),
                  hint: Center(
                    child: Center(
                        child: Text('''   Hangi Seçimde Aday Olmak 
                 İstersiniz?''',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.8))),
                  ),
                  iconEnabledColor: Colors.blueGrey,
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  onChanged: (String? newValue) {},
                  items: <String>[
                    'Başkanlık Seçimi',
                    'Milletvekili Seçimi',
                    'Belediye Başkanlığı Seçimi',
                    'İl Genel Meclisi Seçimi',
                    'Muhtarlık Seçimi'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 60, right: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          backgroundColor: Colors.white,
                          title: new Text(
                              "Tebrikler, adaylık başvurunuz alınmıştır! En kısa sürede size e-posta yoluyla dönüş yapılacak veya uygulamamızdan bildirim gönderilecektir."),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              girisYaptiniz()));
                                },
                                child: Text("Ana Sayfaya Dön")),
                          ],
                        );
                      });
                },
                color: Colors.blueGrey[300],
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Aday Ol",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
