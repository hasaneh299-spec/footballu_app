import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Widget لعرض الصور مع التخزين المؤقت (Caching)
class AppCachedImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const AppCachedImage({
    super.key,
    this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _buildPlaceholder();
    }

    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final memWidth = (width * pixelRatio).toInt().clamp(1, 1024);
    final memHeight = (height * pixelRatio).toInt().clamp(1, 1024);

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      memCacheWidth: memWidth,
      memCacheHeight: memHeight,
      maxWidthDiskCache: 1024,
      maxHeightDiskCache: 1024,
      placeholder: (context, url) => _buildPlaceholder(),
      errorWidget: (context, url, error) => _buildPlaceholder(),
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 200),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.image_outlined,
        size: width * 0.4,
        color: Colors.grey.shade400,
      ),
    );
  }
}

/// Widget شعار الفريق
class TeamLogo extends StatelessWidget {
  final String? logoUrl;
  final double size;

  const TeamLogo({
    super.key,
    this.logoUrl,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return AppCachedImage(
      imageUrl: logoUrl,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
