import 'package:ai_recipe/pages/dashboard/providers/dashboard_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dashboard_notifier.g.dart';


@riverpod
class DashBoardNotifier extends _$DashBoardNotifier{

  @override
  DashboardState build () => DashboardState();

   void changeTab(int index){
     state =  state.copyWith(changeTabIndex: index);
   }

}