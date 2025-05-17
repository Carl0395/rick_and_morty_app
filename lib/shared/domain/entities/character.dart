import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/entities/location.dart';

part 'character.freezed.dart';

@freezed
sealed class Character with _$Character {
  factory Character({
    required String id,
    required String name,
    required String image,
    String? status,
    String? species,
    String? type,
    String? gender,
    Location? origin,
    Location? location,
  }) = _Character;
}
