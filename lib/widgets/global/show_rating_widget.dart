import 'package:flutter/material.dart';

class RatingNoPoints extends StatelessWidget {
  final int ratingCount;
  final int maxRating;
  final double iconSize;

  const RatingNoPoints({
    Key? key,
    this.ratingCount = 0, // Default to 0 for no ratings
    this.maxRating = 5,   // Default max rating to 5
    this.iconSize = 15.06 // Default size for icons
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxRating * iconSize + 40, // Dynamic width based on number of icons
      height: iconSize + 5.0, // Slightly more than icon size for padding
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(maxRating, (index) => _buildStarIcon(index < ratingCount)),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '($ratingCount)',
              style: TextStyle(
                color: Color(0xFF9B9B9B),
                fontSize: iconSize * 0.72, // Relative size to icon
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarIcon(bool filled) {
    return Icon(
      filled ? Icons.star : Icons.star_border,
      color: filled ? Colors.amber : Colors.grey,
      size: iconSize,
    );
  }
}
