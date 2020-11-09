import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class StarRating extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _StarRating();
  }
}

class _StarRating extends State<StarRating> {
  var rating;

  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      rating: rating,
      isReadOnly: false,
      size: 20,
      color: Colors.black,
      borderColor: Colors.black,
      filledIconData: Icons.star,
      halfFilledIconData: Icons.star_half,
      defaultIconData: Icons.star_border,
      starCount: 5,
      allowHalfRating: true,
      spacing: 0.0,
      onRated: (value) {
        setState(
          () {
            rating = value;
          },
        );
      },
    );
  }
}
