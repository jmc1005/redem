import '../../../data/services/local/session_service.dart';
import '../../../domain/models/user/user.dart';
import '../../../domain/repository/user_repo.dart';
import '../state_notifier.dart';

class SessionUserController extends StateNotifier<User?> {
  SessionUserController({
    required this.userRepo,
    required this.sessionService,
  }) : super(null);

  final UserRepo userRepo;
  final SessionService sessionService;

  set user(User user) {
    state = user;
    onlyUpdate(state);
  }

  Future<void> signOut() async {
    await userRepo.signOut();
    onlyUpdate(null);
  }
}
