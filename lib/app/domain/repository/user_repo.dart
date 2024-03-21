import '../../data/http/result.dart';
import '../models/user/user.dart';

abstract class UserRepo {
  Future<bool> get isSignedIn;

  // Registrarse
  Future<Result<User, int>> signUp(String email, String password);

  // Ingresar
  Future<Result<User, int>> login(String email, String password);

  // Obtener usuario
  Future<Result<User, int>> getUser();

  // Guardar usuario
  Future<Result<String, int>> saveUser(
    String uuid,
    String firstName,
    String lastName,
    String dateOfBirth,
    String sex,
    String email,
    String userType,
    String city,
    String country,
  );

  // Signout
  Future<void> signOut();
}
