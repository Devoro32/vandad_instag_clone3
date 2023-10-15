import 'package:vandad_insta_gram3/export.dart';

extension BuildContextExtension on BuildContext {
  navigateToScreen({bool isRepalce = false, required Widget child}) {
    if (isRepalce) {
      Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => child));
    } else {
      Navigator.push(this, MaterialPageRoute(builder: (_) => child));
    }
  }

  double getWidth() => MediaQuery.of(this).size.width;
  double getHeight() => MediaQuery.of(this).size.height;
}
