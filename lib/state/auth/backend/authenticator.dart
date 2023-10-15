import 'package:vandad_insta_gram3/export.dart';

//https://youtu.be/vtGCteFYs4M?t=18000
class Authenticator {
  //*https://youtu.be/wpW7mM3AEXI?t=769
  FirebaseAuth get auth => FirebaseAuth.instance;
  //FirebaseAuth auth= FirebaseAuth.instance;

  User? get currentUser => FirebaseAuth.instance.currentUser;
  //alternative way to write the information: https://youtu.be/vtGCteFYs4M?t=18140
  UserId? get userId => currentUser?.uid;
  bool get isAlreadyLoggedIn => userId != null;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
//https://youtu.be/vtGCteFYs4M?t=18160
  String? get email => FirebaseAuth.instance.currentUser?.email;

  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

//FIREBASE AUTHENTICATION /LOGIN/SIGNUP/LOGOUT
//!CONVERTED TO vandad

//*https://youtu.be/wpW7mM3AEXI?t=769 <- different YOUTUBE Video
  Future<AuthResult> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult.success;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return AuthResult.failure;
    }
  }

  Future<AuthResult> signUpUserwithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult.success;

      /*
      final userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
      
       */
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return AuthResult.failure;
    }
  }

  Future<void> signOutUser() async {
    await auth.signOut();
  }

//FACEBOOK LOGIN
/*
  Future<AuthResult> loginWithFacebook() async {
    //https://youtu.be/vtGCteFYs4M?t=18288
    //facebook login

    final loginResult = await FacebookAuth.instance.login();

    final token = loginResult.accesToken?.token;
    if (token == null) {
      //user has aborted loggin process
      return AuthResult.aborted;
    }
    final oauthCredential = FacebookAuthProvider.credential(token);

    try {
      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      return AuthResult.success;
    } on FirebaseAuthException catch (e) {
      final email = e.email;
      final credential = e.credential;
      if (e.code == Constants.accountExistsWithDifferentCredital &&
          email != null &&
          credential != null) {
        final providers =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(
          email,
        );

        if (providers.contains(Constants.googleCom)) {
          await loginWithGoogle();
          FirebaseAuth.instance.currentUser?.linkWithCredential(
            credential,
          );
        }
        return AuthResult.success;
      }
      return AuthResult.failure;
    }
  }
*/
  //GOOGLE LOGIN
  /*
//https://youtu.be/vtGCteFYs4M?t=18700
  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      Constants.emailScope,
    ]);
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }
    final googleAuth = await signInAccount.authentication;
    final oauthCredential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accesToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      return AuthResult.success;
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure;
    }
  }
  */
}
