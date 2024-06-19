// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lomaTV/core/utils/const.dart';
// import 'package:lomaTV/features/edit/data/models/user_model.dart';
// import 'package:lomaTV/features/edit/presentation/manger/cubit/user_state.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//
// class UserCubit extends Cubit<UserState> {
//   UserCubit() : super(InitialUserSate());
//   static UserCubit get(context) => BlocProvider.of(context);
//
//   UserModel? userModel;
//   File? profileImage;
//
//   var picker = ImagePicker();
//
//   Future<void> getProfileImage() async {
//     final pickedFile = await picker.pickImage(
//       source: ImageSource.gallery,
//     );
//     if (pickedFile != null) {
//       profileImage = File(pickedFile.path);
//       emit(PickedImageSuccessUserSate());
//     } else {
//       emit(PickedImageFailureUserSate());
//     }
//   }
//
//   void getUserData() {
//     emit(GetUserDataLoadingUserSate());
//     FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
//       userModel = UserModel.fromJson(value.data()!);
//       emit(GetUserDataSuccessUserSate());
//     }).catchError((error) {
//       emit(GetUserDataFailureUserSate());
//     });
//   }
//
//   void uploadProfileImage({required name, required phone}) {
//     emit(UpdateLoadingUserState());
//     firebase_storage.FirebaseStorage.instance
//         .ref()
//         .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
//         .putFile(profileImage!)
//         .then((value) {
//       value.ref.getDownloadURL().then((value) {
//         updateUser(
//           name: name,
//           phone: phone,
//           image: value,
//         );
//       }).catchError((error) {
//         emit(UpdateSuccessUserState());
//       });
//     }).catchError((error) {
//       emit(UpdateFailureUserState());
//     });
//   }
//
//   void updateUser({
//     required name,
//     required phone,
//     String? image,
//   }) {
//     emit(UpdateLoadingUserState());
//     UserModel usermodel = UserModel(
//       name: name,
//       phone: phone,
//       uId: userModel!.uId,
//       image: image ?? userModel!.image,
//     );
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(usermodel.uId)
//         .update(usermodel.toMap())
//         .then((value) {
//       getUserData();
//     }).catchError((error) {
//       emit(UpdateFailureUserState());
//     });
//   }
// }
