import 'package:flutter/material.dart';

import '../constants/app_constants/app_constants.dart';
import 'image_wrapper_widget.dart';

class CustomGridTileWidget extends StatelessWidget {
  final Function() onTap;
  final String coverUrl;
  final int id;

  const CustomGridTileWidget({
    super.key,
    required this.onTap,
    required this.coverUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:
              coverUrl.isEmpty
                  ? Image.asset(AppConstants.placeHolderAsset)
                  :
                  // Hero(
                  // tag: 'movie${mcuData[i].id}',
                  // tag: 'movie $id',
                  // child:
                  // BlurHash(
                  //   imageFit: BoxFit.fill,
                  //   hash: AppConstants.imageHashValue,
                  //   image: coverUrl,
                  // ),
                  ImageWrapper(url: coverUrl),
          // ),

          //     FadeInImage(
          //   fit: BoxFit.cover,
          //   placeholder:
          //       const AssetImage(AppConstants.placeHolderAsset),
          //   image: NetworkImage(mcuData[i].coverUrl),
          //   imageErrorBuilder: (context, error, stackTrace) =>
          //       Image.asset(AppConstants.placeHolderAsset),
          // ),
        ),
      ),
    );
  }
}
