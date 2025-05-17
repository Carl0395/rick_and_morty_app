// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_characters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCharactersHash() => r'b0f9c3eb83a019912b6c7cbfa70284fccfffa832';

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

/// See also [getCharacters].
@ProviderFor(getCharacters)
const getCharactersProvider = GetCharactersFamily();

/// See also [getCharacters].
class GetCharactersFamily extends Family<AsyncValue<List<Character>>> {
  /// See also [getCharacters].
  const GetCharactersFamily();

  /// See also [getCharacters].
  GetCharactersProvider call(int page) {
    return GetCharactersProvider(page);
  }

  @override
  GetCharactersProvider getProviderOverride(
    covariant GetCharactersProvider provider,
  ) {
    return call(provider.page);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCharactersProvider';
}

/// See also [getCharacters].
class GetCharactersProvider extends AutoDisposeFutureProvider<List<Character>> {
  /// See also [getCharacters].
  GetCharactersProvider(int page)
    : this._internal(
        (ref) => getCharacters(ref as GetCharactersRef, page),
        from: getCharactersProvider,
        name: r'getCharactersProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getCharactersHash,
        dependencies: GetCharactersFamily._dependencies,
        allTransitiveDependencies:
            GetCharactersFamily._allTransitiveDependencies,
        page: page,
      );

  GetCharactersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<List<Character>> Function(GetCharactersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCharactersProvider._internal(
        (ref) => create(ref as GetCharactersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Character>> createElement() {
    return _GetCharactersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCharactersProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCharactersRef on AutoDisposeFutureProviderRef<List<Character>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _GetCharactersProviderElement
    extends AutoDisposeFutureProviderElement<List<Character>>
    with GetCharactersRef {
  _GetCharactersProviderElement(super.provider);

  @override
  int get page => (origin as GetCharactersProvider).page;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
