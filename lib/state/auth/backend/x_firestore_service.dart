import 'package:vandad_insta_gram3/export.dart';

class FireStoreServices extends BaseFireStoreService {
  final _firesStoreInstance = FirebaseFirestore.instance;

  @override
  Future addDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await _firesStoreInstance
          .collection(collectionName)
          .doc(docName)
          .set(data);
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future updateDataToFireStore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await _firesStoreInstance
          .collection(collectionName)
          .doc(docName)
          .update(data)
          .then((value) => print('User updated'))
          .catchError((error) => print('Failed to update user: $error'));
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future getUserDataFromFirebase(String collectionName, String docName) async {
    try {
      final userData = await _firesStoreInstance
          .collection(collectionName)
          .doc(docName)
          .get();
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}
