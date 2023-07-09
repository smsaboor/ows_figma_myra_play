//
// import 'package:ows_figma_myra_play/core/utils/constants.dart';
// import 'package:ows_figma_myra_play/model/model_user.dart';
// import 'package:ows_figma_myra_play/models/model_user.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';
// import 'package:fitness_tracker/core/utils/constants.dart';
// import 'dart:convert';
// part 'profile_state.dart';
//
//
// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit() : super(ProfileState(user:USERDATA,name: USERDATA.name,email: USERDATA.email,imagePath:USERDATA.imagePath ,isDarkMode: USERDATA.isDarkMode));
//
//   void updateProfile(){
//       emit(ProfileState(user: state.user));
//   }
//   void setName(String value)=>emit(ProfileState(user:User(name: value,email:state.user.email ,about: state.user.about,imagePath: state.user.imagePath,isDarkMode: false)));
//   void setEmail(String value)=>emit(ProfileState(user:User(name: state.user.name,email:value ,about: state.user.about,imagePath: state.user.imagePath,isDarkMode: false)));
//   void setImagePath(String value)=>emit(ProfileState(user:User(name: state.user.name,email:state.user.email ,about: state.user.about,imagePath: value,isDarkMode: false)));
//   void setAbout(String value)=>emit(ProfileState(user:User(name: state.user.name,email:state.user.email ,about: value,imagePath: state.user.imagePath,isDarkMode: false)));
//   void setDarkMode(bool value)=>emit(ProfileState(user:User(name: state.user.name,email:state.user.email ,about: state.user.about,imagePath: state.user.imagePath,isDarkMode: false)));
//
// }
