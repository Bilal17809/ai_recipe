// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_notifiers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CollectionsNotifier)
const collectionsProvider = CollectionsNotifierProvider._();

final class CollectionsNotifierProvider
    extends $NotifierProvider<CollectionsNotifier, CollectionsState> {
  const CollectionsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionsNotifierHash();

  @$internal
  @override
  CollectionsNotifier create() => CollectionsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CollectionsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CollectionsState>(value),
    );
  }
}

String _$collectionsNotifierHash() =>
    r'00e0c409ddb1ebb62b825d6aa33276196407c73c';

abstract class _$CollectionsNotifier extends $Notifier<CollectionsState> {
  CollectionsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CollectionsState, CollectionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CollectionsState, CollectionsState>,
              CollectionsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
