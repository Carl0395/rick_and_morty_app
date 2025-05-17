import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';

part 'location.freezed.dart';

@freezed
sealed class Location with _$Location {
  factory Location({
    String? name,
    String? type,
    String? dimension,
    List<Character>? residents,
  }) = _Location;
}
