import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateX, translateY }

class FadeAnimationTranslateY extends StatelessWidget {
  final double delay;
  final Widget child;
  final bool? showAnimation;

  const FadeAnimationTranslateY(
      {required this.delay, required this.child, Key? key, this.showAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    if(!(showAnimation??true)) {
      return child;
    }
    final tween = MultiTween<String>()
      ..add(AniProps.opacity.toString(), Tween(begin: 0.0, end: 1.0),
          const Duration(milliseconds: 500))
      ..add(AniProps.translateY.toString(), Tween(begin: 130.0, end: 0.0),
          const Duration(milliseconds: 500), Curves.easeOut);
    return PlayAnimation(
      delay: Duration(milliseconds: (100 * delay).round()),
      curve: Curves.decelerate,
      // or fastOutSlowIn
      tween: tween,
      child: child,
      builder: (context, child, MultiTweenValues value) => Opacity(
        opacity: value.get(AniProps.opacity.toString()),
        child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY.toString())),
            child: child),
      ),
    );
  }
}

class FadeAnimationTranslateX extends StatelessWidget {
  final double delay;
  final Widget child;
  final bool? showAnimation;
  const FadeAnimationTranslateX(
      {required this.delay, required this.child, Key? key, this.showAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(!(showAnimation??true)) {
      return child;
    }
    final tween = MultiTween<String>()
      ..add(AniProps.opacity.toString(), Tween(begin: 0.0, end: 1.0),
          const Duration(milliseconds: 500))
      ..add(AniProps.translateX.toString(), Tween(begin: 130.0, end: 0.0),
          const Duration(milliseconds: 500), Curves.easeOut);
    return PlayAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      curve: Curves.decelerate,
      // or fastOutSlowIn
      tween: tween,
      child: child,
      builder: (context, child, MultiTweenValues value) => Opacity(
        opacity: value.get(AniProps.opacity.toString()),
        child: Transform.translate(
            offset: Offset(value.get(AniProps.translateX.toString()),0),
            child: child),
      ),
    );
  }
}
