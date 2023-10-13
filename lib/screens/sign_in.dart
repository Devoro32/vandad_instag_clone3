import 'package:vandad_insta_gram3/export.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField('Enter password', Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(height: 20),
                signInSingUpButton(
                  context,
                  true,
                  () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    )
                        .then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    });
                  },
                ),
                signUpOption(context, 'Dont have an account?', 'Sign Up',
                    SignUpScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
