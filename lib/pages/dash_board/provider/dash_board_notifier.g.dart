// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_board_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashBoardNotifier)
const dashBoardProvider = DashBoardNotifierProvider._();

final class DashBoardNotifierProvider
    extends $NotifierProvider<DashBoardNotifier, DashBoardState> {
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
  Override overrideWithValue(DashBoardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashBoardState>(value),
    );
  }
}

String _$dashBoardNotifierHash() => r'bad0ab043737131330b63e0f26ad0a8a110e41d2';

abstract class _$DashBoardNotifier extends $Notifier<DashBoardState> {
  DashBoardState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DashBoardState, DashBoardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DashBoardState, DashBoardState>,
              DashBoardState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
