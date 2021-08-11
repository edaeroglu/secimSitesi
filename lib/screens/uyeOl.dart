import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_day_23/bloc/login_bloc/loginBloc.dart';
import 'package:login_page_day_23/screens/girisYap.dart';
import 'package:login_page_day_23/screens/girisYaptiniz.dart';

import '../bloc/login_bloc/loginBloc.dart';
import '../model/usersModel.dart';

class uyeOlSayfasi extends StatelessWidget {
  uyeOlSayfasi({Key? key}) : super(key: key);
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final TextEditingController passCcontroller = TextEditingController();

// BURANIN İŞİ BİTMEDİ

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Üye Ol",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ücretsiz hesap oluşturun",
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: emailC,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "E-Posta",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.8,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: passC,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Şifre",
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
                  SizedBox(height: 8.0),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: passCcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Şifre Tekrar",
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
                  SizedBox(height: 18.0),
                  Text(
                    "ya da",
                    style: (TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 18.0),
                  TextFormField(
                    textAlign: TextAlign.center,
                    //controller: passCcontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "Telefon Numarası",
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
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,

                  /// normal üye olma kısmı
                  onPressed: () async {
                    var model = UserModel(
                      userAuth: 0,
                      userMail: emailC.text,
                      userPassword: passC.text,
                    );

                    if (passC.text == passCcontroller.text) {
                      userBloc.add(
                        LoginEventSingUp(userModel: model),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => girisYaptiniz()));
                    }

                    // şifre tekrarının yanlış olması durumu
                    else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title:
                                  Text("Eposta ve Şifrenizi kontrol ediniz."),
                            );
                          });
                    }
                  },
                  color: Colors.grey[400],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Üye Ol",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Zaten hesabın var mı? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => girisYapSayfasi()));
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
