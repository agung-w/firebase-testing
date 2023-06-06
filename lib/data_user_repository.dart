import 'package:cloud_firestore/cloud_firestore.dart';

class DataUserRepository {
  Future<Map<String, dynamic>> getDataFromFirestore(
      String documentId, FirebaseFirestore? fireStore) async {
    fireStore = fireStore ?? FirebaseFirestore.instance;
    try {
      DocumentSnapshot<Map<String, dynamic>>? snapshot =
          await fireStore.collection('users').doc(documentId).get();
      if (snapshot.exists) {
        return snapshot.data()!;
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }
}
