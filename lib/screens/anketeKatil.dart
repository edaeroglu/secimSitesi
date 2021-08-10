import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page_day_23/screens/girisYaptiniz.dart';
import 'package:polls/polls.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anketler',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: anketeKatil(),
    );
  }
}

class anketeKatil extends StatefulWidget {
  @override
  _anketeKatilState createState() => _anketeKatilState();
}

class _anketeKatilState extends State<anketeKatil> {
  double option1 = 1.0;
  double option2 = 1.5;
  double option3 = 1.0;
  double option4 = 0.0;
  double option5 = 1.0;

  String user = "";
  Map usersWhoVoted = {};
  String creator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          "Anket-1",
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
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Polls(
                    children: [
                      // This cannot be less than 2, else will throw an exception
                      Polls.options(title: 'AKP', value: option1),
                      Polls.options(title: 'MHP', value: option2),
                      Polls.options(title: 'CHP', value: option3),
                      Polls.options(title: 'HDP', value: option4),
                      Polls.options(title: 'İyi Parti', value: option5),
                    ],
                    question: Text(
                      'Şuan bir seçim olsa hangi partiye oy verirsiniz?',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    currentUser: this.user,
                    creatorID: this.creator,
                    voteData: usersWhoVoted,
                    userChoice: usersWhoVoted[this.user],
                    onVoteBackgroundColor: Colors.blueGrey[400],
                    leadingBackgroundColor: Colors.blueGrey,
                    backgroundColor: Colors.white,
                    onVote: (secim) {
                      print(secim);
                      setState(() {
                        this.usersWhoVoted[this.user] = secim;
                      });
                      if (secim == 1) {
                        setState(() {
                          option1 += 1.0;
                        });
                      }
                      if (secim == 2) {
                        setState(() {
                          option2 += 1.0;
                        });
                      }
                      if (secim == 3) {
                        setState(() {
                          option3 += 1.0;
                        });
                      }
                      if (secim == 4) {
                        setState(() {
                          option4 += 1.0;
                        });
                      }
                      if (secim == 5) {
                        setState(() {
                          option5 += 1.0;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 500,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/anket1.png'), fit: BoxFit.contain),
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
        ]),
      ),
    );
  }
}
