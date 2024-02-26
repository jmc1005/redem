import 'package:freezed_annotation/freezed_annotation.dart';

import '../typedefs.dart';

part 'symptom.freezed.dart';
part 'symptom.g.dart';

@freezed
class Symptom with _$Symptom {
  const factory Symptom(
    uuid,
    name,
    @JsonKey(name: 'is_active') isActive,
    scale,
    @JsonKey(name: 'create_at') createAt,
  ) = _Symptom;

  factory Symptom.fromJson(Json json) => _$SymptomFromJson(json);
}
