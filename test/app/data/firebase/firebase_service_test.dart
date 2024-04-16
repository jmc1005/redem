import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redem/app/data/firebase/firebase_service.dart';
import 'package:redem/app/domain/models/typedefs.dart';

import '../../../utils/map_list_contains.dart';

void main() {
  group('Firebase Service', () {
    FirebaseService? firebaseService;
    FakeFirebaseFirestore? fakeFirebaseFirestore;
    const Json data = {'data': '42'};

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
    });

    group('Collection Operations', () {
      test('addToCollection', () async {
        firebaseService = FirebaseService(firestore: fakeFirebaseFirestore!);

        const String collectionPath = 'collectionPath';

        await firebaseService?.addToCollection(
          data: data,
          collectionPath: collectionPath,
        );

        final List<Json> actualDataList =
            (await fakeFirebaseFirestore!.collection('collectionPath').get())
                .docs
                .map((e) => e.data())
                .toList();

        expect(actualDataList, MapListContains(null, data));
      });
    });
  });
}
