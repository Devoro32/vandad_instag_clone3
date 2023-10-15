import 'dart:math';

import 'package:vandad_insta_gram3/export.dart';

class XAuthProvider extends ChangeNotifier {
  //https://youtu.be/wpW7mM3AEXI?t=1037
  bool _isLoading = false;
  UserCredential? _userCredential;
  Map<String, dynamic> _userData = {};
  FirebaseAuthClass fauth = FirebaseAuthClass();
  //  FirebaseAuth fauth = FirebaseAuth.instance;
  FireStoreServices fstore = FireStoreServices();

  bool get isLoading => _isLoading;
  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

//https://youtu.be/wpW7mM3AEXI?t=1163
  Future<UserCredential> logInUserWithFirebase(
      String email, String password) async {
    setLoader(true);
    try {
      _userCredential = await fauth.loginUserWithFirebase(
        email,
        password,
      );
      setLoader(false);
      return _userCredential!;
    } catch (e) {
      print(e);
      setLoader(false);
      return Future.error(e);
    }
  }

  Future<UserCredential> signUpUserWithFirebase(
      String email, String password, String name) async {
    var isSuccess = false;
    setLoader(true);
    _userCredential = await fauth.signupUserWithFirebase(
      email,
      password,
      name,
    );
    final data = {
      'email': email,
      'password': password,
      'uuid': _userCredential!.user!.uid,
      'createAt': DateTime.now().millisecondsSinceEpoch.toString(),
      'name': name,
      'bio': '',
      'profilePic': '',
      'batches': [],
    };

    String uid = _userCredential!.user!.uid;
    isSuccess = await addUserToDatabase(data, 'users', uid);
    if (isSuccess) {
      return _userCredential!;
    } else {
      throw Exception('Error to sign up the user');
    }
  }

  Future<bool> addUserToDatabase(
      Map<String, dynamic> data, String collectionName, String docName) async {
    var value = false;
    try {
      await fstore.addDataToFirestore(data, collectionName, docName);

      value = true;
    } catch (e) {
      value = false;
      print(e);
      throw Exception(e.toString());
    }
    return value;
  }

  void logoutUser() {
    fauth.signOutUser();
  }

  setLoader(bool loader) {
    _isLoading = loader;
    notifyListeners();
  }
}

final xauthProvider =
    ChangeNotifierProvider<XAuthProvider>((ref) => XAuthProvider());
