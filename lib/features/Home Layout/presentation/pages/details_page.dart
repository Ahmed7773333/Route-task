import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/features/Home%20Layout/data/models/products_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(this.item, {Key? key}) : super(key: key);
  final Products item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.detailsTitle),
        actions: [
          ImageIcon(
            const AssetImage(AppImages.search),
            size: 24.sp,
            color: AppColors.secondry,
          ),
          SizedBox(width: 32.w),
          Image.asset(
            AppImages.cart,
            color: AppColors.secondry,
            height: 30.h,
            width: 30.w,
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              width: 398.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.thumbnail ?? ''),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                item.title?.substring(0,
                        item.title!.length >= 40 ? 40 : item.title!.length) ??
                    '',
                style: AppStyles.blueLableStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    '${AppStrings.egp} ${item.price}',
                    style: AppStyles.blueLableStyle.copyWith(fontSize: 12.sp),
                  ),
                  Spacer(),
                  Container(
                    width: 102.w,
                    height: 34.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: AppColors.lightSecondry,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '(${item.stock}) Sold',
                        style: AppStyles.smallLableStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Image.asset(AppImages.star),
                  SizedBox(width: 8.w),
                  Text(
                    '${item.rating} (${item.rating})',
                    style: AppStyles.smallLableStyle,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                width: 122.w,
                height: 42.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.secondry,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(AppImages.substruct),
                    Text(
                      '1',
                      textAlign: TextAlign.center,
                      style: AppStyles.whiteLableStyle,
                    ),
                    Image.asset(AppImages.plusC),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                AppStrings.description,
                style: AppStyles.blueLableStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                item.description ?? '',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.smallLableStyle,
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                AppStrings.size,
                style: AppStyles.blueLableStyle,
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                AppStrings.color,
                style: AppStyles.blueLableStyle,
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                AppStrings.total,
                style: AppStyles.erorStyle
                    .copyWith(color: AppColors.lightSecondry),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    '${AppStrings.egp} ${item.price}',
                    style: AppStyles.blueLableStyle.copyWith(fontSize: 12.sp),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondry,
                      fixedSize: Size(267.w, 48.h),
                    ),
                    onPressed: () {},
                    child: Text(
                      AppStrings.add,
                      style: AppStyles.whiteLableStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
