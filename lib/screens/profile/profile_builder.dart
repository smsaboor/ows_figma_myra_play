// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class ProfileBuilder extends StatelessWidget {
//   const ProfileBuilder({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserCubit, UserState>(listener: (context, state) {
//       if (state is UserError) {
//         Scaffold.of(context).showSnackBar(
//           SnackBar(
//             content: Text(state.message),
//           ),
//         );
//       }
//     }, builder: (_, state) {
//       if (state is UserInitial) {
//         return Center(child: Text('Initial'));
//       } else if (state is UserLoading) {
//         return Center(child: Text('Loading'));
//       } else if (state is UserLoaded) {
//         return DisplayProfilePage(user: state.user);
//       } else {
//         // (state is WeatherError)
//         return Center(child: Text('Error'));
//       }
//     });
//   }
// }
