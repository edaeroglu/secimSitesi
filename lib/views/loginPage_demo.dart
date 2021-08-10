import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_day_23/bloc/login_bloc/loginBloc.dart';
import 'package:login_page_day_23/model/usersModel.dart';

class LoginPageDemo extends StatelessWidget {
  LoginPageDemo({Key? key}) : super(key: key);
  final TextEditingController emailC = TextEditingController  ();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("login page demo"),
          bottom: TabBar(
            labelColor: Colors.yellow,
            tabs: [
              Tab(text: "Giriş"),
              Tab(text: "Üye ol"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            giris(context),

            uyelik(context),
          ],
        ),
      ),
    );
  }

  Widget giris(BuildContext context) {
    final userBloc = BlocProvider.of<LoginBloc>(context);
    return Column(
      children: [
        TextFormField(
          controller: emailC,
          decoration: InputDecoration(
            hintText: "eposta girin...",
          ),
        ),
        Text("sifre : 123456"),
        FlatButton(
          color: Colors.green,
          onPressed: () async {
            userBloc.add(
              LoginEventSingIn(userMail: emailC.text, userPassword: "123456"),
            );
          },
          child: Text("giris yap"),
        ),
      ],
    );
  }

  Widget uyelik(BuildContext context) {
    final userBloc = BlocProvider.of<LoginBloc>(context);

    var demoModel = UserModel(
      userAuth: 0,
      userName: "adim soyad",
      userMail: "deneme@asdada.com",
      userCountry: "turkey",
      userCity: "konya",
      userCounty: "selcuklu",
      userDistrict: "asd",
      userPassword: "123456",
    );

    return Column(
      children: [
        Text(

          UserModel(
            userAuth: 0,
            userMail: "deneme@asdada.com",
            userPassword: "123456",
          ).toJson().toString(),

        ),
        TextFormField(
          controller: emailC,
          decoration: InputDecoration(
            hintText: "eposta girin...",
          ),
        ),
        FlatButton(
          color: Colors.green,
          onPressed: () async {
            demoModel.userMail = emailC.text;
            userBloc.add(
              LoginEventSingUp(userModel: demoModel),
            );
          },
          child: Text("uye ol"),
        ),
      ],
    );
  }
}
