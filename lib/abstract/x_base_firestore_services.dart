import 'package:vandad_insta_gram3/export.dart';

abstract class BaseFireStoreService {
  Future addDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName);

  Future updateDataToFireStore(
      Map<String, dynamic> data, String collectionName, String docName);

  Future getUserDataFromFirebase(String collectionName, String docName);
}
