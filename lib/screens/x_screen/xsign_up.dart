import 'package:vandad_insta_gram3/export.dart';

//https://youtu.be/wpW7mM3AEXI?t=1764
//!converted to stateless  widget then consumerwidget
class XSignUpScreen extends ConsumerWidget {
  XSignUpScreen({super.key});

  final TextEditingController emailTextController = TextEditingController();

  final TextEditingController userNameTextController = TextEditingController();

  final TextEditingController passwordTextController = TextEditingController();

//!needed to add Widget ref
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //https://youtu.be/wpW7mM3AEXI?t=1785
    final xauthNotifier = ref.watch(xauthProvider);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
                  reusableTextField('Enter UserName', Icons.person_outline,
                      false, userNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField('Enter email Id', Icons.email_outlined,
                      false, emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField('Enter password', Icons.lock_outline, true,
                      passwordTextController),
                  signInSingUpButton(
                    context,
                    false,
                    () {
                      xauthNotifier
                          .signUpUserWithFirebase(
                              emailTextController.text,
                              passwordTextController.text,
                              userNameTextController.text)
                          .then((value) {
                        print('User : ${value.user}');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const XHomeScreen(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        print("Error: ${error.toString()}");
                      });

/*
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailTextController.text,
                        password: passwordTextController.text,
                      )
                          .then((value) {
                        print('User : ${value.user}');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        print("Error: ${error.toString()}");
                      });
                      */
                    },
                  ),
                  signUpOption(context, 'Already have an account?', 'Login',
                      SignInScreen()),
                ],
              ),
            ),
          ),
        ));
  }
}
