import 'package:flutter/cupertino.dart';

import '../telegram_constants/telegram_constants.dart';

class TelegramScrollController {
  final ScrollController controller;

  TelegramScrollController({double initialOffset = 250.0})
      : controller = ScrollController(initialScrollOffset: initialOffset);

  bool get scrollStopped => !controller.position.isScrollingNotifier.value;

  bool get mustExpand => controller.offset < initialScrollOffset * scrollDesiredPercent;

  bool get mustRetract => !mustExpand && controller.offset < initialScrollOffset;

  void animateToMaxExtent() {
    _cancelScrollAnimation();
    controller.animateTo(
      50,
      duration: duration,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void animateToNormalExtent() {
    _cancelScrollAnimation();
    controller.animateTo(
      initialScrollOffset,
      duration: duration,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void _cancelScrollAnimation() {
    if (controller.position.isScrollingNotifier.value) {
      controller.jumpTo(controller.offset);
    }
  }

  void handleScrollingActivity() {
    if (scrollStopped) {
      if (mustRetract) {
        animateToNormalExtent();
      } else if (mustExpand) {
        animateToMaxExtent();
      }
    }
  }

  void dispose() {
    controller.position.isScrollingNotifier.removeListener(handleScrollingActivity);
    controller.dispose();
  }
}