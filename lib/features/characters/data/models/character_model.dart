import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/features/character_detail/data/models/location_model.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';
part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
sealed class CharacterModel with _$CharacterModel {
  factory CharacterModel({
    required String id,
    required String name,
    required String image,
    String? status,
    String? species,
    String? type,
    String? gender,
    LocationModel? origin,
    LocationModel? location,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}

extension CharacterModelX on CharacterModel {
  Character toEntity() => Character(
    id: id,
    name: name,
    image: image,
    status: status,
    species: species,
    gender: gender,
    type: type,
    origin: origin?.toEntity(),
    location: location?.toEntity(),
  );
}
