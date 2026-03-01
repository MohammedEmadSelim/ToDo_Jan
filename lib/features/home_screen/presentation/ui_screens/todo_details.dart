import 'package:flutter/material.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/features/home_screen/data/models/todo_model.dart';
import 'package:todo_app/features/home_screen/presentation/components/appbar_icon_button.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarIconButton(icon: Icons.access_time, onTap: () {}),
          SizedBox(width: 10.w),

          AppBarIconButton(icon: Icons.edit, onTap: () {}),

          SizedBox(width: 10.w),
          AppBarIconButton(icon: Icons.delete_forever_outlined, onTap: () {}),
          SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: Text(
                todo.des,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
            ),
            if (todo.image != null && todo.image!.isNotEmpty)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(todo.image!, height: 100.h, width: 160.w,fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 60.h,)
                ],
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  todo.deadline,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
