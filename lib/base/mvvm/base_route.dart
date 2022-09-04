enum BaseRouteAction {
  pushTo,
  pop,
  popUntil,
  popUntilRoot,
  replaceWith,
  replaceAllWith
}

class BaseRouteSpec {
  final String name;
  final Map<String, dynamic> arguments;
  final BaseRouteAction action;

  const BaseRouteSpec(
      {required this.name,
        this.arguments = const {},
        this.action = BaseRouteAction.pushTo});

  const BaseRouteSpec.pop()
      : name = '',
        action = BaseRouteAction.pop,
        arguments = const {};

  const BaseRouteSpec.popUntilRoot()
      : name = '',
        action = BaseRouteAction.popUntilRoot,
        arguments = const {};
}