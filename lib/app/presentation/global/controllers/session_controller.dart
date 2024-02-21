import '../../../domain/models/user/user.dart';
import '../../../domain/repository/user_repo.dart';
import '../state_notifier.dart';

class SessionController extends StateNotifier<User?> {
  SessionController({required this.userRepo}) : super(null);

  final UserRepo userRepo;

  void setUser(User user) {
    state = user;
  }

  Future<void> signOut() async {
    await userRepo.signOut();
    onlyUpdate(null);
  }
}
