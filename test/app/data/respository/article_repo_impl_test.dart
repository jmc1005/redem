import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redem/app/data/firebase/firebase_service.dart';
import 'package:redem/app/data/http/result.dart';
import 'package:redem/app/data/repository/article_repo_impl.dart';
import 'package:redem/app/data/services/local/session_service.dart';
import 'package:redem/app/data/services/remote/article_api.dart';
import 'package:redem/app/domain/models/article_data/article_data.dart';
import 'package:redem/app/domain/models/typedefs.dart';

import '../../../utils/map_list_contains.dart';

void main() {
  group('Article Repo', () {
    ArticleRepoImpl? repo;
    FirebaseService? firebaseService;
    FakeFirebaseFirestore? fakeFirebaseFirestore;

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();

      firebaseService = FirebaseService(firestore: fakeFirebaseFirestore!);
      repo = ArticleRepoImpl(
        ArticleApi(firebaseService!),
        SessionService(const FlutterSecureStorage()),
      );
    });

    group('collection articles', () {
      test('getAll', () async {
        final result = await repo?.getAll();

        final value = switch (result) {
          Failure(exception: final exception) => exception,
          Success(value: final articles) => articles,
          null => throw UnimplementedError(),
        };

        final list = await firebaseService?.getFromCollection(
          collectionPath: 'articles',
        );

        if (value is List<ArticleData>) {
          expect(value.length, list!.length);
        }
      });

      test('set', () async {
        const collection = 'articles';

        final data = {
          'article': {
            'uuid': '00000000-0000-0000-0000-000000000000',
            'title': 'Salud en la EM',
            'content':
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            'is_published': false,
            'created_at': ''
          },
          'media': []
        };

        await repo?.set(data);

        final List<Json> actualDataList =
            (await fakeFirebaseFirestore!.collection(collection).get())
                .docs
                .map((e) => e.data())
                .toList();

        expect(actualDataList, MapListContains('article', data));
      });

      test('get', () async {
        const documentPath = 'documentPath';
        final result = await repo?.get(documentPath);

        final value = switch (result) {
          Failure(exception: final exception) => exception,
          Success(value: final article) => article,
          null => throw UnimplementedError(),
        };

        final article = await firebaseService?.getFromDocument(
          collectionPath: 'articles',
          documentPath: documentPath,
        );

        if (value is List<ArticleData>) {
          expect(value, article);
        }
      });
    });
  });
}
