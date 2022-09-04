import 'dart:async';

import 'package:base_flutter/base/mvvm/base_route.dart';
import 'package:base_flutter/base/mvvm/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
RouteObserver<ModalRoute<void>>();

abstract class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);
}

abstract class ViewState<V extends BaseView, VM extends BaseViewModel> extends State<V>
    with RouteAware {
  late final VM _viewModel;
  late final Logger logger;

  VM get viewModel => _viewModel;

  String get _sanitisedRoutePageName {
    return '$runtimeType'.replaceAll('_', '').replaceAll('State', '');
  }

  @mustCallSuper
  ViewState(this._viewModel) {
    logger = Logger();
    logger.d('Created $runtimeType.');
  }

  @mustCallSuper
  @override
  initState() {
    super.initState();
    viewModel.init();
  }

  @mustCallSuper
  @override
  didChangeDependencies() {
    super.didChangeDependencies();

    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @mustCallSuper
  @override
  void didPopNext() {
    logger.d('$_sanitisedRoutePageName didPopNext');
    viewModel.routingDidPopNext();
  }

  @mustCallSuper
  @override
  didPush() {
    logger.d('$_sanitisedRoutePageName didPush');
    viewModel.routingDidPush();
  }

  @mustCallSuper
  @override
  void didPushNext() {
    logger.d('$_sanitisedRoutePageName didPushNext');
    viewModel.routingDidPushNext();
  }

  @mustCallSuper
  @override
  void didPop() {
    logger.d('$_sanitisedRoutePageName didPop');
    viewModel.routingDidPop();
  }

  @mustCallSuper
  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    logger.d('Disposing $runtimeType.');
    viewModel.dispose();
    super.dispose();
  }

  StreamSubscription<BaseRouteSpec> listenToRouteSpec(
      Stream<BaseRouteSpec> routes) {
    return routes.listen((spec) async {
      switch (spec.action) {
        case BaseRouteAction.pushTo:
          await Navigator.of(context)
              .pushNamed(spec.name, arguments: spec.arguments);
          break;
        case BaseRouteAction.pop:
          Navigator.of(context).pop();
          break;
        case BaseRouteAction.popUntil:
          Navigator.of(context)
              .popUntil((route) => route.settings.name == spec.name);
          break;
        case BaseRouteAction.popUntilRoot:
          Navigator.of(context).popUntil((route) => route.isFirst);
          break;
        case BaseRouteAction.replaceWith:
          await Navigator.of(context)
              .pushReplacementNamed(spec.name, arguments: spec.arguments);
          break;
        case BaseRouteAction.replaceAllWith:
          await Navigator.of(context)
              .pushNamedAndRemoveUntil(spec.name, (route) => false);
          break;
      }
    });
  }
}