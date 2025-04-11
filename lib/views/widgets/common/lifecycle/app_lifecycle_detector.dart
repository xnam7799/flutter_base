import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/native_module/callbacks.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppAndScreenLifecycleDetector extends StatefulWidget {
  final BuildContext context;
  final void Function()? didPushFunc;
  final void Function()? didPushNextFunc;
  final void Function()? didPopFunc;
  final void Function()? didPopNextFunc;
  final void Function()? inactiveFunc;
  final void Function()? resumedFunc;
  final void Function()? pausedFunc;

  const AppAndScreenLifecycleDetector({
    super.key,
    required this.context,
    this.didPushFunc,
    this.didPushNextFunc,
    this.didPopFunc,
    this.didPopNextFunc,
    this.inactiveFunc,
    this.resumedFunc,
    this.pausedFunc,
  });

  @override
  AppAndScreenLifecycleDetectorState createState() =>
      AppAndScreenLifecycleDetectorState();
}

class AppAndScreenLifecycleDetectorState
    extends State<AppAndScreenLifecycleDetector>
    with RouteAware, WidgetsBindingObserver {
  AppLifecycleState? lifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute),
    );
    if (Platform.isAndroid) {
      startListening((hasFocus) {
        if (lifecycleState == null) return;
        if (hasFocus) {
          if (widget.resumedFunc == null) return;
          widget.resumedFunc!();
        } else {
          widget.inactiveFunc?.call();
          widget.pausedFunc?.call();
        }
      }, "onWindowFocusChange");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void didPush() {
    if (widget.didPushFunc == null) return;
    widget.didPushFunc!();
  }

  @override
  void didPushNext() {
    if (widget.didPushNextFunc == null) return;
    widget.didPushNextFunc!();
  }

  @override
  void didPop() {
    if (widget.didPopFunc == null) return;
    widget.didPopFunc!();
  }

  @override
  void didPopNext() {
    if (widget.didPopNextFunc == null) return;
    widget.didPopNextFunc!();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!ModalRoute.of(context)!.isCurrent) return;
    lifecycleState = state;
    switch (state) {
      case AppLifecycleState.inactive:
        if (widget.inactiveFunc == null) return;
        widget.inactiveFunc!();
        break;
      case AppLifecycleState.resumed:
        if (widget.resumedFunc == null) return;
        widget.resumedFunc!();
        break;
      case AppLifecycleState.paused:
        widget.pausedFunc?.call();
        break;
      default:
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
