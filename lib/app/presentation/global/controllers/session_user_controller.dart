import '../../../domain/models/user/user.dart';
import '../../../domain/repository/user_repo.dart';
import '../state_notifier.dart';

class SessionUserController extends StateNotifier<User?> {
  SessionUserController({required this.userRepo}) : super(null);

  final UserRepo userRepo;

  set user(User user) {
    state = user;
  }

  Future<void> signOut() async {
    await userRepo.signOut();
    onlyUpdate(null);
  }
}
