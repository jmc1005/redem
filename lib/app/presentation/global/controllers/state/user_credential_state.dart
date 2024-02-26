import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credential_state.freezed.dart';

@freezed
class UserCredentialState with _$UserCredentialState {
  const factory UserCredentialState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool loading,
  }) = _UserCredentialState;
}
