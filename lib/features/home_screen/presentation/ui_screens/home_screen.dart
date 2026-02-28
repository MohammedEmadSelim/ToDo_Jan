import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/auth/presentation/ui_screens/register_screen.dart';
import 'package:todo_app/features/home_screen/data/data_source/home_data_source.dart';
import 'package:todo_app/features/home_screen/data/models/todo_param.dart';
import 'package:todo_app/features/home_screen/presentation/components/select_image_widget.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_custom_field.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_read_only%20_fiedl.dart';
import 'package:todo_app/features/home_screen/presentation/conrollers/home_cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController desController = TextEditingController();

  final TextEditingController deadLineController = TextEditingController();
  File? todoImage;

  @override
  void initState() {
    context.read<HomeCubit>().getTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset('assets/images/logo_icon.svg'),
        actions: [
          Icon(
            Icons.person_2_outlined,
            size: 42.h,
            color: AppColors.mediumGrey,
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeGetTodosLoading) {
            return CircularProgressIndicator();
          }
          if (state is HomeGetTodosSuccess) {
            var todos = state.todos;
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemBuilder: (context, index) {
                return Container(
                  height: 160.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    color: AppColors.pinkRed,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              todos[index].title,
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: 21.sp,
                              ),
                            ),
                            Icon(Icons.timelapse, color: AppColors.textWhite),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        todos[index].des,
                        maxLines: 4,
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                    Spacer(),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 21.w,vertical: 10.h),
                        child: Row(
                          children: [
                            Text(todos[index].deadline,
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 21.h),
              itemCount: todos.length,
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.pinkRed,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.softPink,
            isScrollControlled: true,
            context: context,
            builder: (_) => BlocProvider(
              create: (_) => HomeCubit(),
              child: Container(
                height: 850.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 24.h),
                        ToDoCustomTextField(
                          title: "title".tr(),
                          controller: titleController,
                        ),
                        SizedBox(height: 24.h),

                        ToDoCustomTextField(
                          title: "description".tr(),
                          controller: desController,
                          maxLines: 18,
                        ),
                        SizedBox(height: 24.h),

                        ToDoReadOnlyTextField(
                          title: "deadline_optional".tr(),
                          controller: deadLineController,
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: AppColors.veryLightGrey,
                          ),
                          onTap: () async {
                            var res = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030),
                            );
                            if (res != null) {
                              deadLineController.text = DateFormat(
                                'dd MMMM yyyy',
                              ).format(res);
                              setState(() {});
                            }
                          },
                        ),
                        SizedBox(height: 24.h),

                        // image , sized bix,
                        SelectImageWidget(
                          deadLineController: deadLineController,
                          image: todoImage,
                          onChanged: (image) {
                            todoImage = image;
                          },
                        ),
                        SizedBox(height: 24.h),

                        BlocConsumer<HomeCubit, HomeState>(
                          listener: (context, state) {
                            if (state is HomeCreateTodoSuccess) {
                              Navigator.pop(context);
                            }
                          },
                          builder: (context, state) {
                            if (state is HomeCreateTodoLoading) {
                              return CircularProgressIndicator();
                            }
                            return CustomButton(
                              title: 'add_todo'.tr(),
                              buttonBackgroundColor: AppColors.textWhite,
                              testColor: AppColors.softPink,
                              onTap: () {
                                titleController.text;
                                desController.text;
                                deadLineController.text;
                                todoImage;
                                print(todoImage?.path);

                                context.read<HomeCubit>().createTodo(
                                  TodoParam(
                                    title: titleController.text,
                                    des: desController.text,
                                    deadline: deadLineController.text,
                                    image: todoImage,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add, size: 32.h, color: AppColors.textWhite),
      ),
    );
  }
}
