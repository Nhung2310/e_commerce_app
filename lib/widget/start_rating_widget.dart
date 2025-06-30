import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';

// ignore: must_be_immutable
class StartRatingWidget extends StatelessWidget {
  const StartRatingWidget({
    this.startCount = 5,
    this.rating = 0.0,
    this.color,
    super.key,
  });
  final int startCount;
  final double rating;
  final Color? color;

  Widget buildStar(final BuildContext context, final int index) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(Icons.star_border, size: 16, color: AppColor.grayColor);
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        size: 16,
        color: color ?? AppColor.amberColor,
      );
    } else {
      icon = Icon(Icons.star, size: 16, color: color ?? AppColor.amberColor);
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        startCount,
        (final index) => buildStar(context, index),
      ),
    );
  }
}

class StarRatingInput extends StatefulWidget {
  final int starCount;
  final double initialRating;
  final ValueChanged<double> onRatingChanged;
  final double iconSize;

  const StarRatingInput({
    Key? key,
    this.starCount = 5,
    this.initialRating = 0.0,
    required this.onRatingChanged,
    this.iconSize = 50,
  }) : super(key: key);

  @override
  _StarRatingInputState createState() => _StarRatingInputState();
}

class _StarRatingInputState extends State<StarRatingInput> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  Widget _buildStar(int index) {
    Icon icon;
    if (index >= _currentRating) {
      icon = Icon(
        Icons.star_border,
        size: widget.iconSize,
        color: AppColor.grayColor,
      );
    } else if (index > _currentRating - 1 && index < _currentRating) {
      icon = Icon(
        Icons.star_half,
        size: widget.iconSize,
        color: AppColor.amberColor,
      );
    } else {
      icon = Icon(
        Icons.star,
        size: widget.iconSize,
        color: AppColor.amberColor,
      );
    }

    return GestureDetector(
      onTapDown: (details) {
        RenderBox box = context.findRenderObject() as RenderBox;
        Offset localPos = box.globalToLocal(details.globalPosition);

        double tappedStarIndex =
            localPos.dx /
            (widget.iconSize * widget.starCount) *
            widget.starCount;

        double newRating = (tappedStarIndex * 2).round() / 2;

        if (newRating < 0) newRating = 0;
        if (newRating > widget.starCount)
          newRating = widget.starCount.toDouble();

        setState(() {
          _currentRating = newRating;
        });
        widget.onRatingChanged(_currentRating);
      },

      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.starCount, (index) => _buildStar(index)),
    );
  }
}
