import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageProvider = StateProvider.autoDispose<double>((_) => 0);