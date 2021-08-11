import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page_day_23/main.dart';
import 'package:login_page_day_23/screens/profilEk.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: profilEkrani(),
    );
  }
}

class profilEkrani extends StatefulWidget {
  @override
  _profilEkraniState createState() => _profilEkraniState();
}

class _profilEkraniState extends State<profilEkrani> {
  bool showPassword = false;
  TextStyle _style = TextStyle(fontSize: 55);
  bool _isDark = false;
  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Colors.green,
  );
  ThemeData _dark = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: _dark,
      theme: _light,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      color: Theme.of(context).cardColor,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profili Düzenle',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[700],
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => profilEk()));
            },
          ),
          actions: [
            IconButton(
                color: Colors.black,
                icon: Icon(darkMode.themeNotifier.value == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode),
                onPressed: () {
                  setState(() {
                    darkMode.themeNotifier.value =
                        darkMode.themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                    _isDark = !_isDark;
                  });
                })
            /*CupertinoSwitch(
                value: _isDark,
                onChanged: (v) {
                  setState(() {
                    _isDark = !_isDark;
                  });
                },
              ),*/
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "",
                                ))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.grey[700],
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "                     Ad-Soyad",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.5),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "                   Doğum Tarihi",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.5),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "                       E-posta",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.5),
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
                //buildTextField("Şifre", "********", true),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "                        Konum",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.5),
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
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      child: Text("Vazgeç",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.grey[700],
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Kaydet",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
