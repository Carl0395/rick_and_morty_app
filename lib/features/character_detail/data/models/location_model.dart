import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/entities/location.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
sealed class LocationModel with _$LocationModel {
  factory LocationModel({
    String? name,
    String? type,
    String? dimension,
    List<CharacterModel>? residents,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

extension LocationModelX on LocationModel {
  Location toEntity() => Location(
    name: name,
    type: type,
    dimension: dimension,
    residents: residents?.map((c) => c.toEntity()).toList(),
  );
}
