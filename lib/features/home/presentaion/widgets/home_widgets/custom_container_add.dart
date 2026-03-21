import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/features/home/data/models/todo_model.dart';
import '../../../../../core/responsive/responsive_extension.dart';
import '../../../../../core/theme/app_color.dart';
class CustomContainerAdd extends StatelessWidget {
   CustomContainerAdd({
    super.key,
    required this.todo,
    this.isPrimary=false,
     required this.onTap
     // required this.titleController,
     // required this.desController,
     // required this.deadLineController,
     // required this.imageController,
    // required this.title,
    // required this.description,
    // required this.date,
  });
  final void Function()? onTap;
  final TodoModel todo;
  final bool isPrimary ;
   // final TextEditingController titleController ;
  // final TextEditingController desController ;
  // final TextEditingController deadLineController ;
  // final TextEditingController imageController ;
  // final String title;
  // final String description;
  // final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 170.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.h),
            color: isPrimary ?  AppColor.kPurple:
                AppColor.kPurple1
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.h,vertical: 15.h),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  Text(todo.title,style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.w600,letterSpacing: 1.h,color: AppColor.kWhite),),
                  Spacer(),
                  const Icon(Icons.access_time_outlined,color: AppColor.kWhite,)
                ],
              ),
              SizedBox(height: 15.h,),
              Expanded(flex:6,child: SingleChildScrollView(child: Text(todo.des,style: TextStyle(fontSize: 17.h,fontWeight: FontWeight.w400,letterSpacing: 1.h,color: AppColor.kWhite.withValues(alpha: .9)),))),
              Spacer(),
              Text( todo.deadline??"Null",style: TextStyle(fontSize: 14.h,fontWeight: FontWeight.w400,color: AppColor.kWhite.withOpacity(.9)),),
            ],
          ),
        ),
      ),
    )
;
  }
}
