import '../../data/http/result.dart';
import '../models/user/user.dart';

abstract class UserRepo {
  Future<bool> get isSignedIn;

  // Registrarse
  Future<Result<User, Exception>> signUp(String email, String password);

  // Ingresar
  Future<Result<User, Exception>> login(String email, String password);

  // Obtener usuario
  Future<Result<User, Exception>> getUser();

  Future<void> signOut();
}
