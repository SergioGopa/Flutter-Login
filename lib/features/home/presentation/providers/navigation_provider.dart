import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = NotifierProvider<NavigationNotifier, int>(
  () => NavigationNotifier(),
);

class NavigationNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setTab(int index) {
    state = index;
  }

  void goToToday() => state = 0;
  void goToExplore() => state = 1;
  void goToFavorite() => state = 2;
  void goToProfile() => state = 3;
}
