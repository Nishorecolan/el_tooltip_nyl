import 'package:flutter/material.dart';

import 'element_box.dart';
import 'enum/nyl_tooltip_position.dart';
import 'tooltip_elements_display.dart';
class PositionManager {
  final ElementBox arrowBox;
  final ElementBox triggerBox;
  final ElementBox overlayBox;
  final ElementBox screenSize;
  final double distance;
  final Radius radius;

  PositionManager({
    required this.arrowBox,
    required this.triggerBox,
    required this.overlayBox,
    required this.screenSize,
    this.distance = 0.0,
    this.radius = Radius.zero,
  });

  ToolTipElementsDisplay _topStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w)).floorToDouble(),
        y: (triggerBox.y - distance - arrowBox.h).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) + 2,
        y: triggerBox.y - overlayBox.h - distance - arrowBox.h,
      ),
      position: NYLTooltipPosition.topStart,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: Radius.zero,
        bottomRight: radius,
      ),
    );
  }

  ToolTipElementsDisplay _topCenter() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - _half(arrowBox.w))
            .floorToDouble(),
        y: (triggerBox.y - distance - arrowBox.h).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - _half(overlayBox.w),
        y: triggerBox.y - overlayBox.h - distance - arrowBox.h,
      ),
      position: NYLTooltipPosition.topCenter,
      radius: BorderRadius.all(radius),
    );
  }

  ToolTipElementsDisplay _topEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - arrowBox.w).floorToDouble(),
        y: (triggerBox.y - distance - arrowBox.h).floorToDouble(),
      ),
      bubble: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: triggerBox.x - overlayBox.w + _half(triggerBox.w) - 1,
        y: triggerBox.y - overlayBox.h - distance - arrowBox.h,
      ),
      position: NYLTooltipPosition.topEnd,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: Radius.zero,
      ),
    );
  }

  ToolTipElementsDisplay _bottomStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w)).ceilToDouble(),
        y: (triggerBox.y + triggerBox.h + distance).ceilToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) + 2.5,
        y: triggerBox.y + triggerBox.h + distance + arrowBox.h,
      ),
      position: NYLTooltipPosition.bottomStart,
      radius: BorderRadius.only(
        topLeft: Radius.zero,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
    );
  }

  ToolTipElementsDisplay _bottomCenter() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: arrowBox.w,
        h: arrowBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - _half(arrowBox.w)).ceilToDouble(),
        y: (triggerBox.y + triggerBox.h + distance).ceilToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - _half(overlayBox.w)+30,
        y: triggerBox.y + triggerBox.h + distance + arrowBox.h-.05,
      ),
      position: NYLTooltipPosition.bottomCenter,
      radius: BorderRadius.all(radius),
    );
  }

  ToolTipElementsDisplay _bottomEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + _half(triggerBox.w) - arrowBox.w),
        y: (triggerBox.y + triggerBox.h + distance).ceilToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + _half(triggerBox.w) - overlayBox.w,
        y: triggerBox.y + triggerBox.h + distance + arrowBox.h,
      ),
      position: NYLTooltipPosition.bottomEnd,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: Radius.zero,
        bottomLeft: radius,
        bottomRight: radius,
      ),
    );
  }

  ToolTipElementsDisplay _leftStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x - overlayBox.x - distance - arrowBox.h)
            .floorToDouble(),
        y: triggerBox.y + _half(triggerBox.h),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x - overlayBox.x - overlayBox.w - distance - arrowBox.h,
        y: triggerBox.y + _half(triggerBox.h),
      ),
      position: NYLTooltipPosition.leftStart,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: Radius.zero,
        bottomLeft: radius,
        bottomRight: radius,
      ),
    );
  }

  ToolTipElementsDisplay _leftEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x - overlayBox.x - distance - arrowBox.h)
            .floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h) - arrowBox.w).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x - overlayBox.x - overlayBox.w - distance - arrowBox.h,
        y: triggerBox.y + _half(triggerBox.h) - overlayBox.h,
      ),
      position: NYLTooltipPosition.leftEnd,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: Radius.zero,
      ),
    );
  }

  ToolTipElementsDisplay _rightStart() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + triggerBox.w + distance).floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h)).floorToDouble(),
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + triggerBox.w + distance + arrowBox.h)
            .floorToDouble(),
        y: (triggerBox.y + _half(triggerBox.h)).floorToDouble(),
      ),
      position: NYLTooltipPosition.rightStart,
      radius: BorderRadius.only(
        topLeft: Radius.zero,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
    );
  }

  ToolTipElementsDisplay _rightEnd() {
    return ToolTipElementsDisplay(
      arrow: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: (triggerBox.x + triggerBox.w + distance).floorToDouble(),
        y: triggerBox.y + _half(triggerBox.h) - arrowBox.w,
      ),
      bubble: ElementBox(
        w: overlayBox.w,
        h: overlayBox.h,
        x: triggerBox.x + triggerBox.w + distance + arrowBox.h,
        y: triggerBox.y + _half(triggerBox.h) - overlayBox.h,
      ),
      position: NYLTooltipPosition.rightEnd,
      radius: BorderRadius.only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: Radius.zero,
        bottomRight: radius,
      ),
    );
  }

  double _half(double size) {
    return size * 0.5;
  }

  bool _fitsScreen(ToolTipElementsDisplay el) {
    if (el.bubble.x > 0 &&
        el.bubble.x + el.bubble.w < screenSize.w &&
        el.bubble.y > 35 &&
        el.bubble.y + el.bubble.h < screenSize.h) {
      return true;
    }
    return false;
  }

  ToolTipElementsDisplay _firstAvailablePosition() {
    List<ToolTipElementsDisplay Function()> positions = [
      _topCenter,
      _bottomCenter,
      _topStart,
      _topEnd,
      _rightEnd,
      _bottomStart,
      _bottomEnd,
    ];
    for (var position in positions) {
      if (_fitsScreen(position())) return position();
    }
  return _bottomCenter();
  }

  ToolTipElementsDisplay load({NYLTooltipPosition? preferredPosition}) {
    ToolTipElementsDisplay elementPosition;

    switch (preferredPosition) {
      case NYLTooltipPosition.topStart:
        elementPosition = _topStart();
        break;
      case NYLTooltipPosition.topCenter:
        elementPosition = _topCenter();
        break;
      case NYLTooltipPosition.topEnd:
        elementPosition = _topEnd();
        break;
      case NYLTooltipPosition.bottomStart:
        elementPosition = _bottomStart();
        break;
      case NYLTooltipPosition.bottomCenter:
        elementPosition = _bottomCenter();
        break;
      case NYLTooltipPosition.bottomEnd:
        elementPosition = _bottomEnd();
        break;
      case NYLTooltipPosition.leftStart:
        elementPosition = _leftStart();
        break;
      case NYLTooltipPosition.leftEnd:
        elementPosition = _leftEnd();
        break;
      case NYLTooltipPosition.rightStart:
        elementPosition = _rightStart();
        break;
      case NYLTooltipPosition.rightEnd:
        elementPosition = _rightEnd();
        break;
      default:
        elementPosition = _topCenter();
        break;
    }

    return _fitsScreen(elementPosition)
        ? elementPosition
        : _firstAvailablePosition();
  }
}
