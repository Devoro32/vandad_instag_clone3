import 'package:vandad_insta_gram3/export.dart';

//https://youtu.be/wpW7mM3AEXI?t=780
class FirebaseAuthClass extends BaseFirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  bool isUserLoggedIn() {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<UserCredential> loginUserWithFirebase(String email, String password) {
    final userCredential =
        auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  @override
  void signOutUser() {
    auth.signOut();
  }

  @override
  Future<UserCredential> signupUserWithFirebase(
      String email, String password, String name) async {
    final userCredential = auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential;
  }
}
