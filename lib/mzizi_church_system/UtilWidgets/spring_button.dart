
import 'package:flutter/material.dart';
//https://github.com/aliyigitbireroglu/flutter-spring-button
enum SpringButtonType {
  OnlyScale,
  WithOpacity,
}

class SpringButton extends StatefulWidget {
  ///Use this value to determine the type of animation to be played.
  final SpringButtonType springButtonType;

  ///The widget that is to be displayed on your regular UI.
  final Widget uiChild;

  ///Set this to true if your [uiChild] doesn't change at runtime.
  final bool useCache;

  ///Use this value to determine the alignment of the animation.
  final Alignment alignment;

  ///Use this value to determine the scaling factor while the animation is being played. Choose a value between 0.0 and 1.0.
  final double scaleCoefficient;

  final GestureTapDownCallback onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCallback? onTap;
  final GestureTapCancelCallback? onTapCancel;
  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapUpCallback? onSecondaryTapUp;
  final GestureTapCancelCallback? onSecondaryTapCancel;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;
  final GestureLongPressUpCallback? onLongPressUp;
  final GestureLongPressEndCallback? onLongPressEnd;
  final GestureDragDownCallback? onVerticalDragDown;
  final GestureDragStartCallback? onVerticalDragStart;
  final GestureDragUpdateCallback? onVerticalDragUpdate;
  final GestureDragEndCallback? onVerticalDragEnd;
  final GestureDragCancelCallback? onVerticalDragCancel;
  final GestureDragDownCallback? onHorizontalDragDown;
  final GestureDragStartCallback? onHorizontalDragStart;
  final GestureDragUpdateCallback? onHorizontalDragUpdate;
  final GestureDragEndCallback? onHorizontalDragEnd;
  final GestureDragCancelCallback? onHorizontalDragCancel;
  final GestureDragDownCallback? onPanDown;
  final GestureDragStartCallback? onPanStart;
  final GestureDragUpdateCallback? onPanUpdate;
  final GestureDragEndCallback? onPanEnd;
  final GestureDragCancelCallback? onPanCancel;
  final GestureScaleStartCallback? onScaleStart;
  final GestureScaleUpdateCallback? onScaleUpdate;
  final GestureScaleEndCallback? onScaleEnd;
  final GestureForcePressStartCallback? onForcePressStart;
  final GestureForcePressPeakCallback? onForcePressPeak;
  final GestureForcePressUpdateCallback? onForcePressUpdate;
  final GestureForcePressEndCallback? onForcePressEnd;

  const SpringButton(
    this.springButtonType,
    this.uiChild, {
    Key? key,
    this.useCache = true,
    this.alignment = Alignment.center,
    this.scaleCoefficient = 0.75,
    required this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
  })  : assert(scaleCoefficient >= 0.0 && scaleCoefficient <= 1.0),
        super(key: key);

  @override
  SpringButtonState createState() => SpringButtonState(
        springButtonType,
        useCache,
        alignment,
        scaleCoefficient,
      );
}

class SpringButtonState extends State<SpringButton> with SingleTickerProviderStateMixin {
  final SpringButtonType springButtonType;
  late Widget uiChild;
  final bool useCache;
  final Alignment alignment;
  final double scaleCoefficient;

  ///The [AnimationController] used to create the spring effect.
  late AnimationController animationController;
  late Animation<double> animation;

  bool isSpringDown = false;

  bool isEnabled = true;

  ///Use this value to determine the depth of debug logging that is actually only here for myself and the Swiss scientists.
  final int _debugLevel = 0;

  SpringButtonState(
    this.springButtonType,
    this.useCache,
    this.alignment,
    this.scaleCoefficient,
  );

  @override
  void initState() {
    super.initState();

    if (useCache) uiChild = wrapper();

    animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 1000),
    );
    animationController.value = 1;
    animation = Tween(
      begin: scaleCoefficient,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  bool get hasMultiple {
    List<bool> list = [hasTap, hasSecondaryTap, hasDoubleTap, hasLongPress, hasVerticalDrag, hasHorizontalDrag, hasForcePress, hasPan, hasScale];
    return list.where((bool b) => b).length > 1;
  }

  bool get hasTap => widget.onTapDown != null || widget.onTapUp != null || widget.onTap != null || widget.onTapCancel != null;
  bool get hasSecondaryTap => widget.onSecondaryTapDown != null || widget.onSecondaryTapUp != null || widget.onSecondaryTapCancel != null;
  bool get hasDoubleTap => widget.onDoubleTap != null;
  bool get hasLongPress => widget.onLongPress != null || widget.onLongPressStart != null || widget.onLongPressMoveUpdate != null || widget.onLongPressUp != null || widget.onLongPressEnd != null;
  bool get hasVerticalDrag => widget.onVerticalDragDown != null || widget.onVerticalDragStart != null || widget.onVerticalDragUpdate != null || widget.onVerticalDragEnd != null || widget.onVerticalDragCancel != null;
  bool get hasHorizontalDrag => widget.onHorizontalDragDown != null || widget.onHorizontalDragStart != null || widget.onHorizontalDragUpdate != null || widget.onHorizontalDragEnd != null || widget.onHorizontalDragCancel != null;
  bool get hasForcePress => widget.onForcePressStart != null || widget.onForcePressPeak != null || widget.onForcePressUpdate != null || widget.onForcePressEnd != null;
  bool get hasPan => widget.onPanDown != null || widget.onPanStart != null || widget.onPanUpdate != null || widget.onPanCancel != null;
  bool get hasScale => widget.onScaleStart != null || widget.onScaleUpdate != null || widget.onScaleEnd != null;

  void enable() {
    if (!isEnabled) {
      animationController.value = 1.0;
      isSpringDown = false;
      isEnabled = true;
    }
  }

  void disable() {
    if (isEnabled) {
      animationController.value = 1.0;
      isSpringDown = false;
      isEnabled = false;
    }
  }

  void springDown() {
    if (!isEnabled) return;

    if (_debugLevel > 0) print("springDown");

    isSpringDown = true;
    animationController.value = 0;
  }

  Future spring() async {
    if (!isEnabled) return;

    if (_debugLevel > 0) print("spring-1");

    isSpringDown = false;

    if (hasMultiple) await Future.delayed(const Duration(milliseconds: 5));

    if (_debugLevel > 0) print("spring-2");

    if (!isSpringDown) animationController.forward();
  }

  Future springUp() async {
    if (!isEnabled) return;

    if (_debugLevel > 0) print("springUp-1");

    isSpringDown = false;

    if (hasMultiple) await Future.delayed(const Duration(milliseconds: 500));

    if (_debugLevel > 0) print("springUp-2");

    if (!isSpringDown) animationController.value = 1;
  }

  Widget wrapper() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: !hasTap
          ? null
          : (details) {
              springDown();
              if (widget.onTapDown != null && isEnabled) widget.onTapDown(details);
            },
      onTapUp: !hasTap
          ? null
          : (details) {
              spring();
              if (widget.onTapUp != null && isEnabled) widget.onTapUp!(details);
            },
      onTap: !hasTap
          ? null
          : () {
              if (widget.onTap != null && isEnabled) widget.onTap!();
            },
      onTapCancel: !hasTap
          ? null
          : () {
              springUp();
              if (widget.onTapCancel != null && isEnabled) widget.onTapCancel!();
            },
      onSecondaryTapDown: !hasSecondaryTap
          ? null
          : (details) {
              springDown();
              if (widget.onSecondaryTapDown != null && isEnabled) widget.onSecondaryTapDown!(details);
            },
      onSecondaryTapUp: !hasSecondaryTap
          ? null
          : (details) {
              spring();
              if (widget.onSecondaryTapUp != null && isEnabled) widget.onSecondaryTapUp!(details);
            },
      onSecondaryTapCancel: !hasSecondaryTap
          ? null
          : () {
              springUp();
              if (widget.onSecondaryTapCancel != null && isEnabled) widget.onSecondaryTapCancel!();
            },
      onDoubleTap: !hasDoubleTap
          ? null
          : () {
              springDown();
              spring();
              if (widget.onDoubleTap != null && isEnabled) widget.onDoubleTap!();
            },
      onLongPress: !hasLongPress
          ? null
          : () {
              if (widget.onLongPress != null && isEnabled) widget.onLongPress!();
            },
      onLongPressStart: !hasLongPress
          ? null
          : (details) {
              springDown();
              if (widget.onLongPressStart != null && isEnabled) widget.onLongPressStart!(details);
            },
      onLongPressMoveUpdate: !hasLongPress
          ? null
          : (details) {
              if (widget.onLongPressMoveUpdate != null && isEnabled) widget.onLongPressMoveUpdate!(details);
            },
      onLongPressUp: !hasLongPress
          ? null
          : () {
              spring();
              if (widget.onLongPressUp != null && isEnabled) widget.onLongPressUp!();
            },
      onLongPressEnd: !hasLongPress
          ? null
          : (details) {
              if (widget.onLongPressEnd != null && isEnabled) widget.onLongPressEnd!(details);
            },
      onVerticalDragDown: !hasVerticalDrag
          ? null
          : (details) {
              if (widget.onVerticalDragDown != null && isEnabled) widget.onVerticalDragDown!(details);
            },
      onVerticalDragStart: !hasVerticalDrag
          ? null
          : (details) {
              springDown();
              if (widget.onVerticalDragStart != null && isEnabled) widget.onVerticalDragStart!(details);
            },
      onVerticalDragUpdate: !hasVerticalDrag
          ? null
          : (details) {
              if (widget.onVerticalDragUpdate != null && isEnabled) widget.onVerticalDragUpdate!(details);
            },
      onVerticalDragEnd: !hasVerticalDrag
          ? null
          : (details) {
              spring();
              if (widget.onVerticalDragEnd != null && isEnabled) widget.onVerticalDragEnd!(details);
            },
      onVerticalDragCancel: !hasVerticalDrag
          ? null
          : () {
              springUp();
              if (widget.onVerticalDragCancel != null && isEnabled) widget.onVerticalDragCancel!();
            },
      onHorizontalDragDown: !hasHorizontalDrag
          ? null
          : (details) {
              if (widget.onHorizontalDragDown != null && isEnabled) widget.onHorizontalDragDown!(details);
            },
      onHorizontalDragStart: !hasHorizontalDrag
          ? null
          : (details) {
              springDown();
              if (widget.onHorizontalDragStart != null && isEnabled) widget.onHorizontalDragStart!(details);
            },
      onHorizontalDragUpdate: !hasHorizontalDrag
          ? null
          : (details) {
              if (widget.onHorizontalDragUpdate != null && isEnabled) widget.onHorizontalDragUpdate!(details);
            },
      onHorizontalDragEnd: !hasHorizontalDrag
          ? null
          : (details) {
              spring();
              if (widget.onHorizontalDragEnd != null && isEnabled) widget.onHorizontalDragEnd!(details);
            },
      onHorizontalDragCancel: !hasHorizontalDrag
          ? null
          : () {
              springUp();
              if (widget.onHorizontalDragCancel != null && isEnabled) widget.onHorizontalDragCancel!();
            },
      onForcePressStart: !hasForcePress
          ? null
          : (details) {
              springDown();
              if (widget.onForcePressStart != null && isEnabled) widget.onForcePressStart!(details);
            },
      onForcePressPeak: !hasForcePress
          ? null
          : (details) {
              if (widget.onForcePressPeak != null && isEnabled) widget.onForcePressPeak!(details);
            },
      onForcePressUpdate: !hasForcePress
          ? null
          : (details) {
              if (widget.onForcePressUpdate != null && isEnabled) widget.onForcePressUpdate!(details);
            },
      onForcePressEnd: !hasForcePress
          ? null
          : (details) {
              spring();
              if (widget.onForcePressEnd != null && isEnabled) widget.onForcePressEnd!(details);
            },
      onPanDown: !hasPan
          ? null
          : (details) {
              if (widget.onPanDown != null && isEnabled) widget.onPanDown!(details);
            },
      onPanStart: !hasPan
          ? null
          : (details) {
              springDown();
              if (widget.onPanStart != null && isEnabled) widget.onPanStart!(details);
            },
      onPanUpdate: !hasPan
          ? null
          : (details) {
              if (widget.onPanUpdate != null && isEnabled) widget.onPanUpdate!(details);
            },
      onPanEnd: !hasPan
          ? null
          : (details) {
              spring();
              if (widget.onPanEnd != null && isEnabled) widget.onPanEnd!(details);
            },
      onPanCancel: !hasPan
          ? null
          : () {
              springUp();
              if (widget.onPanCancel != null && isEnabled) widget.onPanCancel!();
            },
      onScaleStart: !hasScale
          ? null
          : (details) {
              springDown();
              if (widget.onScaleStart != null && isEnabled) widget.onScaleStart!(details);
            },
      onScaleUpdate: !hasScale
          ? null
          : (details) {
              if (widget.onScaleUpdate != null && isEnabled) widget.onScaleUpdate!(details);
            },
      onScaleEnd: !hasScale
          ? null
          : (details) {
              spring();
              if (widget.onScaleEnd != null && isEnabled) widget.onScaleEnd!(details);
            },
      child: widget.uiChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (springButtonType == SpringButtonType.WithOpacity)
      return AnimatedBuilder(
        animation: animation,
        child: useCache ? uiChild : null,
        builder: (BuildContext context, Widget? cachedChild) {
          return Opacity(
            opacity: animation.value.clamp(0.5, 1.0),
            child: Transform.scale(
              scale: animation.value,
              alignment: alignment,
              child: useCache ? cachedChild : wrapper(),
            ),
          );
        },
      );
    return AnimatedBuilder(
      animation: animation,
      child: useCache ? uiChild : null,
      builder: (BuildContext context, Widget? cachedChild) {
        return Transform.scale(
          scale: animation.value,
          child: useCache ? cachedChild : wrapper(),
        );
      },
    );
  }
}