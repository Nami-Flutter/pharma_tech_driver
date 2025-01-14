import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../core/resources/values_manager.dart';


class ListAnimator extends StatefulWidget {
  final List<Widget>? children;
  final int? duration;
  final double? verticalOffset;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final ScrollController? controller;

  const ListAnimator({
    Key? key,
    this.children,
    this.duration,
    this.scrollDirection = Axis.vertical,

    this.verticalOffset,
    this.physics,  this.controller,
  }) : super(key: key);

  @override
  _ListAnimatorState createState() => _ListAnimatorState();
}

class _ListAnimatorState extends State<ListAnimator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:deviceHeight,
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: ListView.separated(
            controller: widget.controller,
            scrollDirection: widget.scrollDirection,
            itemCount: widget.children!.length,
            physics: widget.physics,
            itemBuilder: (_, index) {
              return AnimationConfiguration.staggeredList(
                position: index,

                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(

                    child: widget.children![index],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return widget.scrollDirection == Axis.vertical
                  ? const SizedBox(height: kFormPaddingVertical,)
                  : const SizedBox(width: kFormPaddingHorizontal,);
            },
          ),
        ),
      ),
    );
  }
}
