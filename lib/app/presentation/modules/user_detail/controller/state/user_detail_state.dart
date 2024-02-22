import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_state.freezed.dart';

@freezed
class UserDetailState with _$UserDetailState {
  const factory UserDetailState({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String dateOfBirth,
    @Default('') String sex,
    @Default('') String userType,
    @Default('') String city,
    @Default('') String country,
  }) = _UserDetailState;
}
