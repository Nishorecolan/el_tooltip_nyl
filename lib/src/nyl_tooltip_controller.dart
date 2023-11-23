import 'package:flutter/material.dart';

import '../nyl_tooltip.dart';
typedef ShowNYLTooltip = Future<void> Function();
typedef HideNYLTooltip = Future<void> Function();

class NYLTooltipController extends ValueNotifier<NYLTooltipStatus> {
  NYLTooltipController()
      : _show = _defaultThrow,
        _hide = _defaultThrow,
        super(NYLTooltipStatus.hidden);

  Future<void> show() async {
    await _show();
    value = NYLTooltipStatus.showing;
    notifyListeners();
  }

  void notify(NYLTooltipStatus status) {
    if (value != status) {
      value = status;
      notifyListeners();
    }
  }

  Future<void> hide() async {
    await _hide();
    value = NYLTooltipStatus.hidden;
    notifyListeners();
  }

  late ShowNYLTooltip _show;
  late HideNYLTooltip _hide;

  static Future<void> _defaultThrow() {
    throw StateError('Attach the controller to an El Tooltip Widget');
  }

  @mustCallSuper
  void attach({required ShowNYLTooltip show, required HideNYLTooltip hide}) {
    _show = show;
    _hide = hide;
  }
}
