import 'package:vandad_insta_gram3/export.dart';

//https://youtu.be/wpW7mM3AEXI?t=730
abstract class BaseFirebaseService {
  Future<UserCredential> loginUserWithFirebase(String email, String password);
  Future<UserCredential> signupUserWithFirebase(
      String email, String password, String name);
  void signOutUser();
  bool isUserLoggedIn();
}
