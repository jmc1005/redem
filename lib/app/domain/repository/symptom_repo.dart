import '../../data/http/result.dart';
import '../models/symptom/Symptom.dart';

abstract class SymptomRepo {
  Future<Result<Symptom, Exception>> getAllSymptom(String token);
}
