import '/pages/your_collection/providers/collections_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'collections_notifiers.g.dart';

@riverpod
class CollectionsNotifier extends _$CollectionsNotifier{

  @override
  CollectionsState build() => CollectionsState();
}