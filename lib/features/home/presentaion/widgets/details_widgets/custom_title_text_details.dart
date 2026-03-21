import 'package:flutter/cupertino.dart';

import '../../../../../core/responsive/responsive_extension.dart';
import '../../../../../core/theme/app_color.dart';

class CustomTextTitleDetails extends StatelessWidget {
  const CustomTextTitleDetails({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Text("$title",textAlign:TextAlign.start,style: TextStyle(fontSize: 19.sp,fontWeight: FontWeight.w600,color: AppColor.kBlack),) ;
  }
}
