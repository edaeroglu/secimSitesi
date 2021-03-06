import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:login_page_day_23/bloc/login_bloc/loginBloc.dart';
import 'package:login_page_day_23/helpers/locator.dart';
import 'package:login_page_day_23/screens/hosgeldiniz.dart';
import 'package:login_page_day_23/screens/profilEkran%C4%B1.dart';
import 'package:login_page_day_23/views/votePage.dart';

Future<void> main() async {
  setupLocator();
  runApp(darkMode());

  runApp(App());
}

class darkMode extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.amber),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: profilEkrani(),
          );
        });
  }
}

class AppTheme {
  static const int _themaColorDefault = 0xffffcdac;

  static MaterialColor themeColor = MaterialColor(
    _themaColorDefault,
    <int, Color>{
      500: Color(_themaColorDefault),
    },
  );
  static Color wipeColor = Color.fromRGBO(255, 171, 137, 1);

  static Color homeBackgrounColor = Color.fromRGBO(245, 245, 245, 1);
  static Color bottomIconColor = Color.fromRGBO(255, 102, 102, 1);
  static Color blueColor = Color.fromRGBO(0, 216, 201, 1);
  static Color profilBackgrounColor = Color.fromRGBO(243, 247, 252, 1);
  // dark
  static Color darkDurumEkleButtonColor = Color.fromRGBO(115, 133, 159, 1);

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.deepOrange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Colors.deepOrange,
      backgroundColor: themeColor,
      buttonColor: wipeColor,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Color.fromRGBO(40, 40, 40, 1),
        ),
        bodyText2: TextStyle(
          color: Colors.black54,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black54,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppTheme.wipeColor,
        unselectedItemColor: Colors.black54,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: themeColor,
        elevation: 2,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: wipeColor,
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 18.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
      cardColor: Color.fromRGBO(245, 245, 245, 1),
      cardTheme: CardTheme(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.blue,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.black12,
        thickness: 0.5,
        indent: 4.0,
        endIndent: 4.0,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.grey[900],
      scaffoldBackgroundColor: Color.fromRGBO(51, 51, 51, 1),
      textTheme: ThemeData.dark().textTheme,
      primarySwatch: Colors.grey,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: Color.fromRGBO(45, 45, 45, 1),
      buttonColor: darkDurumEkleButtonColor,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color.fromRGBO(40, 40, 40, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: Color.fromRGBO(60, 60, 60, 1),
        elevation: 2,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(45, 45, 45, 1),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 18.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Color.fromRGBO(66, 71, 80, 1),
      ),
      cardColor: Color.fromRGBO(66, 71, 80, 1),
      cardTheme: CardTheme(
        elevation: 5,
        color: Color.fromRGBO(66, 71, 80, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white12,
        thickness: 0.5,
        indent: 4.0,
        endIndent: 4.0,
      ),
    );
  }

  static TextStyle homeTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc()..add(LoginEventFetch()),
      child: MaterialApp(
        title: 'Se??im Sitesi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginStateLoading) {
              // uygulama ilk ac??ld??g??nda (oturum kayd?? sorgulan??rken) bu widget cal????acak
              return Center(child: CircularProgressIndicator());
            } else if (state is LoginStateClosedSession) {
              // henuz giri?? yapan kullan??c?? yoksa buras?? cal????acak
              return OnBoardingPage();
            } else if (state is LoginStateOpenedSession) {
              // kullan??c?? daha once uygulamaya giri?? yapt??ysa buras?? ??al????acak
              return VotePage();
            } else {
              return CircularProgressIndicator();
            }
          },
        ), //OnBoardingPage(),
      ),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => tanitimSayfasi()),
    );
  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFFF6F0D2),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Hemen ilerleyin!',
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Her Hafta Yenilenen Se??imler",
          body: "Her pazartesi yap??lacak olan se??imlerle halk??n nabz?? tutulur.",
          image: _buildImage('denem.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Adaylar??n Kendini Tan??tma ??mkan??",
          body:
              "Adaylar video yoluyla kendilerini tan??t??p,vaatlerini sunabilir.",
          image: _buildImage('2sayfa.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Se??menlerle Adaylar??n ??leti??imi",
          body: "Se??menler ve adaylar sohbet odalar??nda ileti??im kurabilir.",
          image: _buildImage('3sayfa.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "G??ncel Siyasi Anketlerle Se??menin Nabz??",
          body:
              "Farkl?? konularda anketler ile halk??n fikirleri al??n??r ve sonu??lar a????klan??r.",
          image: _buildImage('4sayfa.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Konuma Dayal?? Oy Verme ve Anket ????lemleri",
          body:
              "Konum se??ilerek o konumda mevcut olan se??imlerde oy verme imkan?? sa??lar.",
          image: _buildImage('5sayfa.png'),
          /*footer: ElevatedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: const Text(
              'FooButton',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),*/
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Siyasi G??ndem ??le ??lgili Haberler",
          body:
              "Siyasi g??ndem ve se??imlerle ilgili haberler s??rekli yenilenir. ",
          image: _buildImage('6sayfa.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Atla'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Bitti', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class tanitimSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Z' SE????M",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Merienda',
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Yeni Nesil Se??im Platformu",
                    style: TextStyle(
                      fontFamily: 'Caveat',
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                width: 500,
                height: 270,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/zsecim.png'), fit: BoxFit.fill),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      /*border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )*/
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Hosgeldiniz()));
                      },
                      color: Colors.blueGrey[600],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Oy Ver",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      /*border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )*/
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Hosgeldiniz()));
                      },
                      color: Colors.blueGrey[600],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Anketlere Kat??l",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      /*border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )*/
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Hosgeldiniz()));
                      },
                      color: Colors.blueGrey[600],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "G??ndemde Ne Var?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
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
            enabledBorder: OutlineInputBorder(
                //grey 400
                borderSide: BorderSide(color: Colors.grey)),
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
