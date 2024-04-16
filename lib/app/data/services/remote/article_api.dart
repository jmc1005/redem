import '../../../domain/models/typedefs.dart';
import '../../firebase/firebase_service.dart';

class ArticleApi {
  final FirebaseService _firebaseService;

  ArticleApi(this._firebaseService);

  final String collection = 'articles';

  Future<List<Json>> getAll() {
    return _firebaseService.getFromCollection(
      collectionPath: collection,
    );
  }

  Future<Json> get(String documentPath) {
    return _firebaseService.getFromDocument(
      collectionPath: collection,
      documentPath: documentPath,
    );
  }

  Future<Json> set(Json data, String documentPath) {
    return _firebaseService.setDataOnDocument(
      data: data,
      collection: collection,
      documentPath: documentPath,
    );
  }
}
