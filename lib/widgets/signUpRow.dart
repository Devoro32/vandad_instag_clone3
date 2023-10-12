import 'package:vandad_insta_gram3/export.dart';

Row signUpOption(BuildContext context, String message, String text, screen) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        message,
        style: const TextStyle(
          color: Colors.white70,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return screen!;
              },
            ),
          );
        },
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}
