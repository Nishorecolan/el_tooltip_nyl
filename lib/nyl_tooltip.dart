library el_tooltip;
import 'package:el_tooltip_example/src/nyl_tooltip_overlay.dart';
import 'package:flutter/material.dart';

import 'nyl_tooltip.dart';
import 'src/bubble.dart';
import 'src/element_box.dart';
import 'src/enum/nyl_tooltip_position.dart';
import 'src/enum/nyl_tooltip_status.dart';
import 'src/modal.dart';
import 'src/modal_configuration.dart';
import 'src/position_manager.dart';
import 'src/tooltip_elements_display.dart';

export 'src/nyl_tooltip_controller.dart';
export 'src/enum/nyl_tooltip_position.dart';
export 'src/enum/nyl_tooltip_status.dart';
export 'src/modal_configuration.dart';

class NYLTooltip extends StatefulWidget {
   NYLTooltip({
    required this.content,
    required this.child,
    this.color = Colors.white,
    this.distance = 10.0,
    this.padding = const EdgeInsets.all(14.0),
    this.position = NYLTooltipPosition.topCenter,
    this.radius = const Radius.circular(8),
    this.showModal = true,
    this.showArrow = true,
    this.showChildAboveOverlay = true,
    this.modalConfiguration = const ModalConfiguration(),
    this.timeout = Duration.zero,
    this.appearAnimationDuration = Duration.zero,
    this.disappearAnimationDuration = Duration.zero,
    this.controller,
    this.longTailPosition = 'Center',
    super.key,
  });

  final Widget child;

  final Color color;

  final Widget content;
  final double distance;

  final EdgeInsetsGeometry padding;

  final NYLTooltipPosition position;

  final Radius radius;

  final bool showModal;

  final bool showArrow;

  final bool showChildAboveOverlay;
  final Duration timeout;

  final ModalConfiguration modalConfiguration;
  final Duration appearAnimationDuration;
  final Duration disappearAnimationDuration;
  final NYLTooltipController? controller;

  final longTailPosition;
  _NYLTooltipState? toolTipState;

  @override
  State<NYLTooltip> createState() => toolTipState=_NYLTooltipState();
}

class _NYLTooltipState extends State<NYLTooltip> with WidgetsBindingObserver {
  final ElementBox _arrowBox = ElementBox(h: 10.0, w: 16.0);
  ElementBox _overlayBox = ElementBox(h: 0.0, w: 0.0);

  OverlayEntry? _overlayEntry;
  OverlayEntry? _overlayEntryHidden;
  GlobalKey<NYLTooltipOverlayState>? _overlayKey;

  final GlobalKey _widgetKey = GlobalKey();

  @override
  void didChangeMetrics() {
    hideOverlay();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _loadHiddenOverlay(context));
    WidgetsBinding.instance.addObserver(this);
    widget.controller?.attach(show: _showOverlay, hide: hideOverlay);
  }

  ElementBox get _screenSize => _getScreenSize();

  ElementBox get _triggerBox => _getTriggerSize();

  void _getHiddenOverlaySize(context) {
    RenderBox box = _widgetKey.currentContext?.findRenderObject() as RenderBox;
    if (mounted) {
      setState(() {
        _overlayBox = ElementBox(
          w: box.size.width,
          h: box.size.height,
        );
        _overlayEntryHidden?.remove();
      });
    }
  }
  void _loadHiddenOverlay(_) {
    OverlayState? overlayStateHidden = Overlay.of(context);
    _overlayEntryHidden = OverlayEntry(
      builder: (context) {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => _getHiddenOverlaySize(context));
        return Opacity(
          opacity: 0,
          child: Center(
            child: Bubble(
              key: _widgetKey,
              triggerBox: _triggerBox,
              padding: widget.padding,
              child: widget.content,
            ),
          ),
        );
      },
    );

    if (_overlayEntryHidden != null) {
      overlayStateHidden.insert(_overlayEntryHidden!);
    }
  }

  ElementBox _getTriggerSize() {
    if (mounted) {
      final renderBox = context.findRenderObject() as RenderBox;
      final offset = renderBox.localToGlobal(Offset.zero);
      return ElementBox(
        w: renderBox.size.width,
        h: renderBox.size.height,
        x: offset.dx,
        y: offset.dy,
      );
    }
    hideOverlay();
    return ElementBox(w: 0, h: 0, x: 0, y: 0);
  }
  ElementBox _getScreenSize() {
    return ElementBox(
      w: MediaQuery.of(context).size.width,
      h: MediaQuery.of(context).size.height,
    );
  }

  void _toggleOverlay(BuildContext context) =>
      _overlayEntry != null ? hideOverlay() : _showOverlay(context);

  Future<void> _showOverlay([BuildContext? context]) async {
    context ??= this.context;
    final overlayState = Overlay.of(context);

    ToolTipElementsDisplay toolTipElementsDisplay = PositionManager(
      arrowBox: _arrowBox,
      overlayBox: _overlayBox,
      triggerBox: _triggerBox,
      screenSize: _screenSize,
      distance: widget.distance,
      radius: widget.radius,
    ).load(preferredPosition: widget.position);

    _overlayKey = GlobalKey<NYLTooltipOverlayState>();

    _overlayEntry = OverlayEntry(
      builder: (context) => NYLTooltipOverlay(
        key: _overlayKey,
        toolTipElementsDisplay: toolTipElementsDisplay,
        color: widget.color,
        content: widget.content,
        hideOverlay: hideOverlay,
        triggerBox: _triggerBox,
        arrowBox: _arrowBox,
        modalConfiguration: widget.modalConfiguration,
        padding: widget.padding,
        showArrow: widget.showArrow,
        showChildAboveOverlay: widget.showChildAboveOverlay,
        showModal: widget.showModal,
        appearAnimationDuration: widget.appearAnimationDuration,
        disappearAnimationDuration: widget.disappearAnimationDuration,
        longTailPosition : widget.longTailPosition,
        child: widget.child,
      ),
    );

    if (_overlayEntry != null) {
      widget.controller?.notify(NYLTooltipStatus.showing);
      overlayState.insert(_overlayEntry!);
    }
    if (widget.timeout > Duration.zero) {
      await Future.delayed(widget.timeout).whenComplete(hideOverlay);
    }
  }

  Future<void> hideOverlay() async {
    final state = _overlayKey?.currentState;
    if (state != null) {
      await state.hide();
      _overlayKey = null;
    }
    if (_overlayEntry != null) {
      widget.controller?.notify(NYLTooltipStatus.hidden);
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _toggleOverlay(context),
      child: widget.child,
    );
  }
}
