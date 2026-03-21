import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import '../../../../core/responsive/responsive_extension.dart';

class AppbarSigninRegister extends StatelessWidget implements PreferredSizeWidget {
  const AppbarSigninRegister({super.key,this.showLeading = false});

  final bool showLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showLeading
          ? IconButton(
        onPressed: () { Navigator.of(context).pop(); },
        icon: Icon(Icons.arrow_back_ios_new_outlined,color: AppColor.kPurple,),
      )
          : null,
      backgroundColor: AppColor.kWhite,
      actions: [
        GestureDetector(
          onTap: (){
            if (context.locale == Locale('ar')){
              context.setLocale(Locale('en'));
            }else{
              context.setLocale(Locale('ar'));
            }
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              children: [
                Text("locale".tr(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp,color: AppColor.kPurple,),),
                Icon(Icons.arrow_forward_ios_rounded,color: AppColor.kPurple,)
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
