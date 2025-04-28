import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/extensions/color_extension.dart';

class LeadingButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final Widget? icon;

  /// Leading Button with optional parmaters for icon and onTap
  ///
  /// If onTap is null, it will pop the current screen. Else you'll have to add the pop navigation code in the onTap parameter.
  ///
  /// If icon is null, it will use default back arrow icon
  const LeadingButtonWidget({super.key, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: GestureDetector(
        onTap: onTap ?? () => Navigator.pop(context),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.black.withOpactityValue(0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: BackdropFilter(
            enabled: true,
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child:
                icon ??
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
