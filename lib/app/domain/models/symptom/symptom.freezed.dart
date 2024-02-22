// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Symptom _$SymptomFromJson(Map<String, dynamic> json) {
  return _Symptom.fromJson(json);
}

/// @nodoc
mixin _$Symptom {
  dynamic get uuid => throw _privateConstructorUsedError;
  dynamic get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  dynamic get isActive => throw _privateConstructorUsedError;
  dynamic get scale => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_at')
  dynamic get createAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymptomCopyWith<Symptom> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomCopyWith<$Res> {
  factory $SymptomCopyWith(Symptom value, $Res Function(Symptom) then) =
      _$SymptomCopyWithImpl<$Res, Symptom>;
  @useResult
  $Res call(
      {dynamic uuid,
      dynamic name,
      @JsonKey(name: 'is_active') dynamic isActive,
      dynamic scale,
      @JsonKey(name: 'create_at') dynamic createAt});
}

/// @nodoc
class _$SymptomCopyWithImpl<$Res, $Val extends Symptom>
    implements $SymptomCopyWith<$Res> {
  _$SymptomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? scale = freezed,
    Object? createAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as dynamic,
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SymptomImplCopyWith<$Res> implements $SymptomCopyWith<$Res> {
  factory _$$SymptomImplCopyWith(
          _$SymptomImpl value, $Res Function(_$SymptomImpl) then) =
      __$$SymptomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic uuid,
      dynamic name,
      @JsonKey(name: 'is_active') dynamic isActive,
      dynamic scale,
      @JsonKey(name: 'create_at') dynamic createAt});
}

/// @nodoc
class __$$SymptomImplCopyWithImpl<$Res>
    extends _$SymptomCopyWithImpl<$Res, _$SymptomImpl>
    implements _$$SymptomImplCopyWith<$Res> {
  __$$SymptomImplCopyWithImpl(
      _$SymptomImpl _value, $Res Function(_$SymptomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? scale = freezed,
    Object? createAt = freezed,
  }) {
    return _then(_$SymptomImpl(
      freezed == uuid ? _value.uuid! : uuid,
      freezed == name ? _value.name! : name,
      freezed == isActive ? _value.isActive! : isActive,
      freezed == scale ? _value.scale! : scale,
      freezed == createAt ? _value.createAt! : createAt,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SymptomImpl implements _Symptom {
  const _$SymptomImpl(
      this.uuid,
      this.name,
      @JsonKey(name: 'is_active') this.isActive,
      this.scale,
      @JsonKey(name: 'create_at') this.createAt);

  factory _$SymptomImpl.fromJson(Map<String, dynamic> json) =>
      _$$SymptomImplFromJson(json);

  @override
  final dynamic uuid;
  @override
  final dynamic name;
  @override
  @JsonKey(name: 'is_active')
  final dynamic isActive;
  @override
  final dynamic scale;
  @override
  @JsonKey(name: 'create_at')
  final dynamic createAt;

  @override
  String toString() {
    return 'Symptom(uuid: $uuid, name: $name, isActive: $isActive, scale: $scale, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymptomImpl &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality().equals(other.scale, scale) &&
            const DeepCollectionEquality().equals(other.createAt, createAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(scale),
      const DeepCollectionEquality().hash(createAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SymptomImplCopyWith<_$SymptomImpl> get copyWith =>
      __$$SymptomImplCopyWithImpl<_$SymptomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SymptomImplToJson(
      this,
    );
  }
}

abstract class _Symptom implements Symptom {
  const factory _Symptom(
      final dynamic uuid,
      final dynamic name,
      @JsonKey(name: 'is_active') final dynamic isActive,
      final dynamic scale,
      @JsonKey(name: 'create_at') final dynamic createAt) = _$SymptomImpl;

  factory _Symptom.fromJson(Map<String, dynamic> json) = _$SymptomImpl.fromJson;

  @override
  dynamic get uuid;
  @override
  dynamic get name;
  @override
  @JsonKey(name: 'is_active')
  dynamic get isActive;
  @override
  dynamic get scale;
  @override
  @JsonKey(name: 'create_at')
  dynamic get createAt;
  @override
  @JsonKey(ignore: true)
  _$$SymptomImplCopyWith<_$SymptomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
