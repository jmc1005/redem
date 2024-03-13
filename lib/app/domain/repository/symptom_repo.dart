import '../../data/http/result.dart';
import '../models/symptom/symptom.dart';

abstract class SymptomRepo {
  Future<Result<List<Symptom>, int>> getSymptoms();

  Future<Result<List<Symptom>, int>> getSymptomsByUser();

  Future<Result<String, int>> addSymptomUser(String symptom);

  Future<Result<String, int>> removeSymptomUser(String symptom);
}
