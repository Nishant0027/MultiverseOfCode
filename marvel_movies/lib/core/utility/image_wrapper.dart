import 'package:flutter/material.dart';

class ImageWrapper extends StatelessWidget {
  final String url;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  const ImageWrapper({super.key, required this.url, this.errorBuilder});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder:
          (_, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : Center(
                    child: CircularProgressIndicator.adaptive(
                      value:
                          loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                    ),
                  ),
      errorBuilder:
          errorBuilder ??
          (_, error, stackTrace) {
            return const Center(child: Icon(Icons.error, color: Colors.red));
          },
    );
  }
}
