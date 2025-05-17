// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$characterDetailHash() => r'b3b6e89ca46d0ac944c083f036efb44d630a94b2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [characterDetail].
@ProviderFor(characterDetail)
const characterDetailProvider = CharacterDetailFamily();

/// See also [characterDetail].
class CharacterDetailFamily extends Family<AsyncValue<Character>> {
  /// See also [characterDetail].
  const CharacterDetailFamily();

  /// See also [characterDetail].
  CharacterDetailProvider call(String id) {
    return CharacterDetailProvider(id);
  }

  @override
  CharacterDetailProvider getProviderOverride(
    covariant CharacterDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'characterDetailProvider';
}

/// See also [characterDetail].
class CharacterDetailProvider extends AutoDisposeFutureProvider<Character> {
  /// See also [characterDetail].
  CharacterDetailProvider(String id)
    : this._internal(
        (ref) => characterDetail(ref as CharacterDetailRef, id),
        from: characterDetailProvider,
        name: r'characterDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$characterDetailHash,
        dependencies: CharacterDetailFamily._dependencies,
        allTransitiveDependencies:
            CharacterDetailFamily._allTransitiveDependencies,
        id: id,
      );

  CharacterDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Character> Function(CharacterDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CharacterDetailProvider._internal(
        (ref) => create(ref as CharacterDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Character> createElement() {
    return _CharacterDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CharacterDetailRef on AutoDisposeFutureProviderRef<Character> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CharacterDetailProviderElement
    extends AutoDisposeFutureProviderElement<Character>
    with CharacterDetailRef {
  _CharacterDetailProviderElement(super.provider);

  @override
  String get id => (origin as CharacterDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
