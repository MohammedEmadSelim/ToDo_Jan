import 'package:flutter/cupertino.dart';

import '../../../../../core/responsive/responsive_extension.dart';
import '../../../../../core/theme/app_color.dart';

class CustomTextDetails extends StatelessWidget {
  const CustomTextDetails({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Text("$title",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w400,color: AppColor.kBlack),) ;
  }
}
