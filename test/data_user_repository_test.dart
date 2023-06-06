import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_testing/data_user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'data_user_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<FirebaseFirestore>(),
  MockSpec<DocumentSnapshot>(),
  MockSpec<CollectionReference>(),
  MockSpec<DocumentReference>()
])
// @GenerateMocks([FirebaseFirestore, DocumentSnapshot])
void main() async {
  FirebaseFirestore mockFirebaseFirestore = MockFirebaseFirestore();
  CollectionReference<Map<String, dynamic>> mockCollectionRef =
      MockCollectionReference<Map<String, dynamic>>();
  DocumentReference<Map<String, dynamic>> mockDocumentRef =
      MockDocumentReference<Map<String, dynamic>>();
  DocumentSnapshot<Map<String, dynamic>> mockDocumentSnapshot =
      MockDocumentSnapshot<Map<String, dynamic>>();

  group('Test Get Data From Firestore', () {
    test('success', () async {
      when(mockFirebaseFirestore.collection('users'))
          .thenAnswer((_) => mockCollectionRef);
      when(mockCollectionRef.doc('documentId'))
          .thenAnswer((_) => mockDocumentRef);
      when(mockDocumentRef.get()).thenAnswer((_) async => mockDocumentSnapshot);
      Map<String, dynamic> result = await DataUserRepository()
          .getDataFromFirestore('documentId', mockFirebaseFirestore);
      expect(result,
          mockDocumentSnapshot.exists ? mockDocumentSnapshot.data() : {});
    });
  });
}
