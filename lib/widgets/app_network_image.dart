import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: fit,
      width: width,
      height: height,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
            color: AppColors.primaryBlue,
          ),
        );
      },

      errorBuilder: (context, error, stackTrace) => Center(
        child: Icon(
          Icons.broken_image_outlined,
          size: 80,
          color: AppColors.primaryBlue.withAlpha(100), 
        ),
      ),
    );
  }
}