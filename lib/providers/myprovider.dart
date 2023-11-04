import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../models/userModel.dart';

import '../shared/firebase/firebase_functions.dart';
import '../shared/styles/colors.dart';

class MyProvider extends ChangeNotifier {
  String languagecode = 'en';
  bool isEnglish = true;
  ThemeMode modeApp = ThemeMode.light;
  UserModel? userModel;
  User? firebaseUser;

  MyProvider(){
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser()async{
    firebaseUser=FirebaseAuth.instance.currentUser;
    userModel=await FirebaseFunctions
        .readUserFirestore(firebaseUser!.uid);
    notifyListeners();
  }

  void changelanguage(String langCode) {
    languagecode = langCode;
    notifyListeners();
  }

  mode(ThemeMode mode) {
    modeApp = mode;
    notifyListeners();
  }

//  getBackground() {
//   if (modeApp == ThemeMode.light) {
//     return Scaffold(
//       backgroundColor: mint
//     );
//   } else {
//     return Scaffold(
//         backgroundColor: Color(0xFF141A2E)
//     );
//   }
// }
}