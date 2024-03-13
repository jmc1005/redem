import '../../../domain/models/symptom/symptom.dart';
import '../../../domain/repository/symptom_repo.dart';
import '../state_notifier.dart';

class SessionSymptomController extends StateNotifier<Symptom?> {
  SessionSymptomController({required this.symptomRepo}) : super(null);

  final SymptomRepo symptomRepo;

  set symptom(Symptom symptom) {
    state = symptom;
    onlyUpdate(state);
  }

  get symptomsUser async {
    return await symptomRepo.getSymptomsByUser();
  }
}
