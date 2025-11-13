// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashBoardNotifier)
const dashBoardProvider = DashBoardNotifierProvider._();

final class DashBoardNotifierProvider
    extends $NotifierProvider<DashBoardNotifier, DashboardState> {
  const DashBoardNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashBoardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashBoardNotifierHash();

  @$internal
  @override
  DashBoardNotifier create() => DashBoardNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardState>(value),
    );
  }
}

String _$dashBoardNotifierHash() => r'bdc8b8d91a86123f1cae966a91bf0797c531f264';

abstract class _$DashBoardNotifier extends $Notifier<DashboardState> {
  DashboardState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DashboardState, DashboardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DashboardState, DashboardState>,
              DashboardState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
