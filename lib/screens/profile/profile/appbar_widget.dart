
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ows_figma_myra_play/bloc/theme/theme_cubit.dart';

AppBar buildAppBar(BuildContext context,final icon) {
  bool isDarkMode=true;
  final iconDay = CupertinoIcons.sun_max;
  final iconNight = CupertinoIcons.moon_stars;
  return AppBar(
    automaticallyImplyLeading: false,
    leading: context.read<ThemeCubit>().state.isDarkThemeOn ? Icon(iconNight) : Icon(iconDay),
    elevation: 0,
    actions: [
      BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Switch(
            value: state.isDarkThemeOn,
            onChanged: (newValue) {
              context.read<ThemeCubit>().toggleSwitch(newValue);
            },
          );
        },
      ),
    ],
  );
}
