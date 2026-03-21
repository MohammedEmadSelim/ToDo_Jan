import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/responsive/responsive_extension.dart';
import '../../../../../core/theme/app_color.dart';

class CustomContainerAddShimmer extends StatelessWidget {
  const CustomContainerAddShimmer({super.key, this.isPrimary = false});

  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 80.h),
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(height: 21.h),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: isPrimary
                ? AppColor.kPurple.withOpacity(0.5)
                : AppColor.kPurple1.withOpacity(0.5),
            highlightColor: Colors.white.withOpacity(0.3),
            child: Container(
              height: 170.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.h),
                color: isPrimary ? AppColor.kPurple : AppColor.kPurple1,
              ),
              padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(width: 120.w, height: 20.h, color: Colors.white),
                      Spacer(),
                      Container(width: 20.h, height: 20.h, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Container(width: double.infinity, height: 17.h, color: Colors.white),
                  SizedBox(height: 5.h),
                  Container(width: 200.w, height: 17.h, color: Colors.white),
                  Spacer(),
                  Container(width: 80.w, height: 14.h, color: Colors.white),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}