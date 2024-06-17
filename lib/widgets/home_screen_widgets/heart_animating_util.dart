import 'package:flutter/material.dart';

class HeartAnimationUtil extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  const HeartAnimationUtil(
      {super.key,
      required this.child,
      required this.isAnimating,
      required this.duration,
      this.onEnd});

  @override
  State<HeartAnimationUtil> createState() => _HeartAnimationUtilState();
}

class _HeartAnimationUtilState extends State<HeartAnimationUtil>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scale;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2));

    scale = Tween<double>(begin: 1, end: 1.2).animate(animationController);
  }

  @override
  void didUpdateWidget(covariant HeartAnimationUtil oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating != oldWidget.isAnimating) {
      initiateAnimation();
    }
  }

  Future<void> initiateAnimation() async {
    if (widget.isAnimating) {
      await animationController.forward();
      await animationController.reverse();
      await Future.delayed(const Duration(milliseconds: 400));

      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: scale,
        child: widget.child,
      );
}
