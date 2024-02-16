import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatelessWidget {
  final void Function()? onTapFavoriteIcon;
  final bool isFavorite;

  const FavoriteIconWidget({
    super.key,
    required this.onTapFavoriteIcon,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: GestureDetector(
        onTap: onTapFavoriteIcon,
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.grey.shade600,
          size: 18,
        ),
      ),
    );
  }
}
