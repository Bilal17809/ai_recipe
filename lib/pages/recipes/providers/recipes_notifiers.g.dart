// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_notifiers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecipesNotifiers)
const recipesNotifiersProvider = RecipesNotifiersProvider._();

final class RecipesNotifiersProvider
    extends $NotifierProvider<RecipesNotifiers, RecipesState> {
  const RecipesNotifiersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipesNotifiersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipesNotifiersHash();

  @$internal
  @override
  RecipesNotifiers create() => RecipesNotifiers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipesState>(value),
    );
  }
}

String _$recipesNotifiersHash() => r'eeb860b2c98d65dd22866158b1b37caf7cef6814';

abstract class _$RecipesNotifiers extends $Notifier<RecipesState> {
  RecipesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RecipesState, RecipesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RecipesState, RecipesState>,
              RecipesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
