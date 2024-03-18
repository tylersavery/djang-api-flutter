// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_form.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentFormHash() => r'81aa362533adbfd2a064cecf5b477827bd1dac43';

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

abstract class _$CommentForm extends BuildlessNotifier<CommentFormState> {
  late final String postUuid;

  CommentFormState build(
    String postUuid,
  );
}

/// See also [CommentForm].
@ProviderFor(CommentForm)
const commentFormProvider = CommentFormFamily();

/// See also [CommentForm].
class CommentFormFamily extends Family<CommentFormState> {
  /// See also [CommentForm].
  const CommentFormFamily();

  /// See also [CommentForm].
  CommentFormProvider call(
    String postUuid,
  ) {
    return CommentFormProvider(
      postUuid,
    );
  }

  @override
  CommentFormProvider getProviderOverride(
    covariant CommentFormProvider provider,
  ) {
    return call(
      provider.postUuid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'commentFormProvider';
}

/// See also [CommentForm].
class CommentFormProvider
    extends NotifierProviderImpl<CommentForm, CommentFormState> {
  /// See also [CommentForm].
  CommentFormProvider(
    String postUuid,
  ) : this._internal(
          () => CommentForm()..postUuid = postUuid,
          from: commentFormProvider,
          name: r'commentFormProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentFormHash,
          dependencies: CommentFormFamily._dependencies,
          allTransitiveDependencies:
              CommentFormFamily._allTransitiveDependencies,
          postUuid: postUuid,
        );

  CommentFormProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postUuid,
  }) : super.internal();

  final String postUuid;

  @override
  CommentFormState runNotifierBuild(
    covariant CommentForm notifier,
  ) {
    return notifier.build(
      postUuid,
    );
  }

  @override
  Override overrideWith(CommentForm Function() create) {
    return ProviderOverride(
      origin: this,
      override: CommentFormProvider._internal(
        () => create()..postUuid = postUuid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postUuid: postUuid,
      ),
    );
  }

  @override
  NotifierProviderElement<CommentForm, CommentFormState> createElement() {
    return _CommentFormProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentFormProvider && other.postUuid == postUuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postUuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommentFormRef on NotifierProviderRef<CommentFormState> {
  /// The parameter `postUuid` of this provider.
  String get postUuid;
}

class _CommentFormProviderElement
    extends NotifierProviderElement<CommentForm, CommentFormState>
    with CommentFormRef {
  _CommentFormProviderElement(super.provider);

  @override
  String get postUuid => (origin as CommentFormProvider).postUuid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
