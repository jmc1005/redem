import '../state_notifier.dart';

class SessionLangController extends StateNotifier<String> {
  SessionLangController({required this.langCode}) : super('es');

  final String langCode;

  set langCode(String lang) {
    state = lang;
  }
}
