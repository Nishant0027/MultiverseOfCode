import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:provider/provider.dart';

import "../../../../core/routes/routes.dart";
import '../../../../core/constants/app_constants/app_constants.dart';
import '../provider/provider.dart';

class MovieGrid extends StatefulWidget {
  const MovieGrid({super.key});

  @override
  State<MovieGrid> createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<McuDataProvider>(
      builder: (context, mcuProvider, child) {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 1.3 / 2,
          ),
          itemCount: mcuProvider.mcuModel.length,
          itemBuilder: (context, i) {
            var mcuData = mcuProvider.mcuModel;

            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.movieDetails,
                  arguments: {'id': mcuData[i].id},
                );
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:
                      mcuData[i].coverUrl.isEmpty
                          ? Stack(
                            children: [
                              Image.asset(AppConstants.placeHolderAsset),
                              Positioned(
                                top: 60,
                                child: Text(
                                  mcuData[i].title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )
                          : Hero(
                            tag: 'movie${mcuData[i].id}',

                            child: BlurHash(
                              imageFit: BoxFit.fill,
                              hash: AppConstants.imageHashValue,
                              image: mcuData[i].coverUrl,
                            ),
                          ),

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
          },
        );
      },
    );
  }
}
