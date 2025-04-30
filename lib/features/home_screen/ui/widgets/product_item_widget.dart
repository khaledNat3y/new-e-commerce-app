import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_theme.dart';

class ProductItemWidget extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;

  const ProductItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: SizedBox(
            width: double.infinity,
            height: 190.h,
            child: Hero(
              transitionOnUserGestures: true,
              placeholderBuilder: (context, size, child) => buildShimmer(),
              tag: "product$title",
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) => buildShimmer(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        verticalSpace(8),
        Text(
          title,
          style: AppTheme.font16BlackSemiBold,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(4),
        Text("\$$price", style: AppTheme.font12GreyMedium),
      ],
    );
  }
}
