import 'package:vandad_insta_gram3/export.dart';

class XSignInScreen extends ConsumerWidget {
  XSignInScreen({super.key});

  final TextEditingController emailTextController = TextEditingController();

  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final xauthNotifier = ref.watch(xauthProvider);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor('CB2093'),
              hexStringToColor('C9546c4'),
              hexStringToColor('5E61f4'),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * .2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget('assets/images/logo2.png'),
                const SizedBox(height: 30),
                reusableTextField(
                  'Enter Username',
                  Icons.person_outline,
                  false,
                  emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField('Enter password', Icons.lock_outline, true,
                    passwordTextController),
                const SizedBox(height: 20),
                signInSingUpButton(
                  context,
                  true,
                  () {
                    xauthNotifier
                        .logInUserWithFirebase(emailTextController.text,
                            passwordTextController.text)
                        .then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const XHomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error: ${error.toString()}");
                    });
/*

                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    )
                        .then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => XHomeScreen()));
                    });
                    */
                  },
                ),
                signUpOption(context, 'Dont have an account?', 'Sign Up',
                    XSignUpScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
