// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ows_figma_myra_play/model/model_user.dart';
// import 'package:ows_figma_myra_play/screens/profile/profile/appbar_widget.dart';
// import 'package:ows_figma_myra_play/screens/profile/profile/profile_widget.dart';
// import 'package:ows_figma_myra_play/screens/profile/profile/textfield_widget.dart';
// import 'package:path/path.dart';
//
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   ModelUser? user;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) =>
//       BlocBuilder<Cubit, ProfileState>(builder: (_, state) {
//         return Scaffold(
//           appBar: buildAppBar(context,null),
//           body: ListView(
//             padding: EdgeInsets.symmetric(horizontal: 32),
//             physics: BouncingScrollPhysics(),
//             children: [
//               ProfileWidget(
//                 imagePath: state.user.imagePath,
//                 isEdit: true,
//                 onClicked: () async {
//                   final image =
//                   await ImagePicker().getImage(source: ImageSource.gallery);
//                   if (image == null) return;
//                   final directory = await getApplicationDocumentsDirectory();
//                   final name = basename(image.path);
//                   final imageFile = File('${directory.path}/$name');
//                   final newImage = await File(image.path).copy(imageFile.path);
//                   BlocProvider.of<ProfileCubit>(context)
//                       .setImagePath(newImage.path);
//                 },
//               ),
//               const SizedBox(height: 24),
//               TextFieldWidget(
//                 label: 'Full Name',
//                 text: state.user.name,
//                 onChanged: (name) =>
//                     BlocProvider.of<ProfileCubit>(context).setName(name),
//               ),
//               const SizedBox(height: 24),
//               TextFieldWidget(
//                 label: 'Email',
//                 text: state.user.email,
//                 onChanged: (email) =>
//                     BlocProvider.of<ProfileCubit>(context).setEmail(email),
//               ),
//               const SizedBox(height: 24),
//               TextFieldWidget(
//                 label: 'About',
//                 text: state.user.about,
//                 maxLines: 5,
//                 onChanged: (about) =>
//                     BlocProvider.of<ProfileCubit>(context).setAbout(about),
//               ),
//               const SizedBox(height: 24),
//               ButtonWidget(
//                 text: 'Save',
//                 onClicked: () {
//                   BlocProvider.of<ProfileCubit>(context).updateProfile();
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       });
// }
