import 'package:vandad_insta_gram3/export.dart';

class XHomeScreen extends ConsumerWidget {
  const XHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        xauthNotifier.logoutUser();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => XSignInScreen()));
                      },
                      child: const Text('Logout'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
