// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:login_page_day_23/bloc/login_bloc/login_bloc.dart';

// class HomePageDemo extends StatelessWidget {
//   const HomePageDemo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
//     return Scaffold(
//         appBar: AppBar(title: Text("home page")),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("hosgeldin..."),
//             SizedBox(height: 60),
//             if (loginBloc.state is LoginStateOpenedSession)
//               Text(
//                 "giris yapan user : \n" +
//                     loginBloc.getUserModel!.toJson().toString(),
//               ),
//           ],
//         ));
//   }
// }
