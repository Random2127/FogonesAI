import 'dart:async';

import 'package:flutter/foundation.dart';

/// Drives [GoRouter.redirect] when [stream] emits (e.g. Firebase auth).
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }
}
