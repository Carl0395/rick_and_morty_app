import 'package:rick_and_morty_app/core/di.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'characters_list.g.dart';

@riverpod
class CharactersList extends _$CharactersList {
  int _page = 1;
  bool _hasMore = true;
  bool _isLoading = false;

  @override
  Future<List<Character>> build() {
    return _getCharacters();
  }

  Future<List<Character>> _getCharacters() async {
    final useCase = ref.watch(getCharactersUseCaseProvider);
    final data = await useCase(_page);
    _hasMore = data.length == 20;
    _page++;
    return data;
  }

  Future<void> loadMore() async {
    if (!_hasMore || _isLoading) return;
    _isLoading = true;

    final currentItems = state.value ?? [];

    try {
      final moreItems = await _getCharacters();
      state = AsyncValue.data([...currentItems, ...moreItems]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isLoading = false;
    }
  }
}
