import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres/application/global.dart';
import 'package:reqres/application/home/home_state.dart';
import 'package:reqres/infrastructure/home_repo.dart';

import '../../utils/network_util/network_handler.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(HomeRepo(), ref);
});

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepo repo;
  final Ref ref;
  HomeNotifier(this.repo, this.ref) : super(HomeState.init());

  void getData() async {
    state = state.copyWith(loading: true);

    final result = await repo.getHomeDate();

    state = result.fold(
      (l) {
        CleanFailureDialogue.show(
          ref.watch(scaffoldKeyProvider).currentContext!,
          failure: l,
        );
        return state.copyWith(failure: l, loading: false);
      },
      (r) {
        return state.copyWith(loading: false, users: r.data);
      },
    );
  }
}
