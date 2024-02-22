// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDetailState {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDetailStateCopyWith<UserDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailStateCopyWith<$Res> {
  factory $UserDetailStateCopyWith(
          UserDetailState value, $Res Function(UserDetailState) then) =
      _$UserDetailStateCopyWithImpl<$Res, UserDetailState>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String dateOfBirth,
      String sex,
      String userType,
      String city,
      String country});
}

/// @nodoc
class _$UserDetailStateCopyWithImpl<$Res, $Val extends UserDetailState>
    implements $UserDetailStateCopyWith<$Res> {
  _$UserDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? sex = null,
    Object? userType = null,
    Object? city = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailStateImplCopyWith<$Res>
    implements $UserDetailStateCopyWith<$Res> {
  factory _$$UserDetailStateImplCopyWith(_$UserDetailStateImpl value,
          $Res Function(_$UserDetailStateImpl) then) =
      __$$UserDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String dateOfBirth,
      String sex,
      String userType,
      String city,
      String country});
}

/// @nodoc
class __$$UserDetailStateImplCopyWithImpl<$Res>
    extends _$UserDetailStateCopyWithImpl<$Res, _$UserDetailStateImpl>
    implements _$$UserDetailStateImplCopyWith<$Res> {
  __$$UserDetailStateImplCopyWithImpl(
      _$UserDetailStateImpl _value, $Res Function(_$UserDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? sex = null,
    Object? userType = null,
    Object? city = null,
    Object? country = null,
  }) {
    return _then(_$UserDetailStateImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserDetailStateImpl implements _UserDetailState {
  const _$UserDetailStateImpl(
      {this.firstName = '',
      this.lastName = '',
      this.dateOfBirth = '',
      this.sex = '',
      this.userType = '',
      this.city = '',
      this.country = ''});

  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String dateOfBirth;
  @override
  @JsonKey()
  final String sex;
  @override
  @JsonKey()
  final String userType;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String country;

  @override
  String toString() {
    return 'UserDetailState(firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, sex: $sex, userType: $userType, city: $city, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailStateImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, dateOfBirth,
      sex, userType, city, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailStateImplCopyWith<_$UserDetailStateImpl> get copyWith =>
      __$$UserDetailStateImplCopyWithImpl<_$UserDetailStateImpl>(
          this, _$identity);
}

abstract class _UserDetailState implements UserDetailState {
  const factory _UserDetailState(
      {final String firstName,
      final String lastName,
      final String dateOfBirth,
      final String sex,
      final String userType,
      final String city,
      final String country}) = _$UserDetailStateImpl;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get dateOfBirth;
  @override
  String get sex;
  @override
  String get userType;
  @override
  String get city;
  @override
  String get country;
  @override
  @JsonKey(ignore: true)
  _$$UserDetailStateImplCopyWith<_$UserDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
