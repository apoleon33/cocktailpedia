import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

/// Custom shimmer with custom duration and color
class CustomShimmer extends Shimmer {
  CustomShimmer({required super.child})
      : super(
          color: Colors.grey[100]!,
          duration: const Duration(milliseconds: 750),
        );
}
