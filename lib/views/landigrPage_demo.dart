// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:login_page_day_23/bloc/login_bloc/loginBloc.dart';
// import 'package:login_page_day_23/main.dart';
// import 'package:login_page_day_23/views/votePage.dart';

// import 'homePage_demo.dart';
// import 'loginPage_demo.dart';

// class LandingPage extends StatelessWidget {
//   const LandingPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<LoginBloc>(
//       create: (context) => LoginBloc()..add(LoginEventFetch()),
//       child: BlocBuilder<LoginBloc, LoginState>(
//         builder: (context, state) {
//           if (state is LoginStateLoading) {
//             return BeklemeEkraniDemo();
//           } else if (state is LoginStateClosedSession) {
//             return OnBoardingPage();
//           } else if (state is LoginStateOpenedSession) {
//             return VotePage();
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }

// class BeklemeEkraniDemo extends StatelessWidget {
//   const BeklemeEkraniDemo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
