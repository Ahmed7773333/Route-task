import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/config/app_routes.dart';
import 'package:route_task/features/Home%20Layout/data/models/products_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';

Widget productItem(Products item, context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, Routes.productScreen,
          arguments: {'product': item});
    },
    child: Container(
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: AppColors.lightSecondry),
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.network(
              item.thumbnail ?? '',
              fit: BoxFit.cover,
              height: 150.h,
              width: 191.w,
            ),
          ),
          Positioned(
            top: 3.h,
            right: 3.w,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: ShapeDecoration(
                  color: AppColors.primary,
                  shape: const OvalBorder(),
                ),
                child: Center(
                  child: ImageIcon(
                    const AssetImage(AppImages.favorite),
                    color: AppColors.secondry,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 65.h,
            left: 8.w,
            child: Text(
              item.title?.substring(
                      0, item.title!.length >= 20 ? 20 : item.title?.length) ??
                  '',
              style: AppStyles.blueLableStyle.copyWith(
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            bottom: 39.h,
            left: 8.w,
            child: Text(
              '${AppStrings.egp} ${item.price}',
              style: AppStyles.blueLableStyle.copyWith(fontSize: 14),
            ),
          ),
          Positioned(
            bottom: 13.h,
            left: 5.w,
            child: Text(
              '${AppStrings.review} (${item.rating}) ',
              style: AppStyles.blueLableStyle.copyWith(fontSize: 14.sp),
            ),
          ),
          Positioned(
            bottom: 16.h,
            left: 95.w,
            child: Image.asset(
              AppImages.star,
              height: 15.h,
              width: 15.w,
            ),
          ),
          Positioned(
            bottom: 8.h,
            left: 153.w,
            child: ImageIcon(
              const AssetImage(AppImages.plus),
              size: 24.sp,
              color: AppColors.secondry,
            ),
          ),
        ],
      ),
    ),
  );
}
