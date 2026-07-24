import 'dart:async';
import 'package:flutter/foundation.dart';

mixin DisposableMixin {
  final List<StreamController<dynamic>> _controllers = [];
  bool _disposed = false;

  bool get isDisposed => _disposed;

  @protected
  StreamController<T> createStreamController<T>({
    bool sync = false,
    void Function()? onListen,
    void Function()? onCancel,
  }) {
    if (_disposed) throw StateError('Cannot create controller after disposal');
    final controller = StreamController<T>.broadcast(
      sync: sync,
      onListen: onListen,
      onCancel: onCancel,
    );
    _controllers.add(controller);
    return controller;
  }

  @protected
  void disposeControllers() {
    if (_disposed) return;
    _disposed = true;
    for (final controller in _controllers) {
      if (!controller.isClosed) {
        try { controller.close(); } catch (_) {}
      }
    }
    _controllers.clear();
  }
}
