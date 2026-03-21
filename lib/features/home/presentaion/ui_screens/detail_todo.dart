import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:to_do_app/features/home/presentaion/widgets/details_widgets/custom_text_details.dart';
import '../../../../core/responsive/responsive_extension.dart';
import '../../data/models/todo_model.dart';
import '../widgets/details_widgets/appbar_details_delete.dart';
import '../widgets/details_widgets/custom_title_text_details.dart';


class DetailTodo extends StatefulWidget {
  const DetailTodo({super.key, required this.todo});
  final TodoModel todo;

  @override
  State<DetailTodo> createState() => _DetailTodoState();
}

class _DetailTodoState extends State<DetailTodo> {
  @override
  void initState() {
    context.read<HomeCubit>().getTodo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppbarDetailsDelete(todo: widget.todo,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:27.h,horizontal: 27.w),
          child: Column(

            crossAxisAlignment: .stretch,
            children: [
              CustomTextTitleDetails(title:widget.todo.title),
              SizedBox(height: 19.h,),
              CustomTextDetails(title: widget.todo.des)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Padding(
              padding:  EdgeInsets.only(bottom:40.h),
              child: CustomTextDetails(title: "${"createdat".tr()} ${widget.todo.deadline}")
            ),
          ],
        ),
      ),
    );
  }
}
