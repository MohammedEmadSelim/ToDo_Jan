import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/auth/presentation/ui_screens/register_screen.dart';
import 'package:todo_app/features/home_screen/data/data_source/home_data_source.dart';
import 'package:todo_app/features/home_screen/data/models/todo_model.dart';
import 'package:todo_app/features/home_screen/data/models/todo_param.dart';
import 'package:todo_app/features/home_screen/presentation/components/select_image_widget.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_card.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_custom_field.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_modal_sheet_widget.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_read_only%20_fiedl.dart';
import 'package:todo_app/features/home_screen/presentation/conrollers/home_cubit/home_cubit.dart';
import 'package:todo_app/features/home_screen/presentation/ui_screens/todo_details.dart';
import 'package:todo_app/features/profile/presentation/ui_screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController desController = TextEditingController();

  final TextEditingController deadLineController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: Icon(
              Icons.person_2_outlined,
              size: 49.h,
              color: AppColors.mediumGrey,
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeGetTodosLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.pinkRed),
            );
          }
          if (state is HomeGetTodosSuccess) {
            var todos = state.todos;
            if (todos.isEmpty) {
              return Center(
                child: Lottie.asset('assets/animations/History.json'),
              );
            }

            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 80.h),
              itemBuilder: (context, index) {
                return TodoCart(
                  todo: todos[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoDetails(todo: todos[index]),
                      ),
                    );
                  },
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
          /// FirebaseAuth.instance.signOut();
          showModalBottomSheet(
            backgroundColor: AppColors.softPink,
            isScrollControlled: true,
            context: context,
            builder: (_) => BlocProvider(
              create: (_) => HomeCubit(),
              child: ToDoModalSheetWidget(
                titleController: titleController,
                desController: desController,
                deadLineController: deadLineController,
                imageController: imageController,
              ),
            ),
          ).then((value) {
            titleController.clear();
            desController.clear();
            deadLineController.clear();
            imageController.clear();
          });
        },
        child: Icon(Icons.add, size: 32.h, color: AppColors.textWhite),
      ),
    );
  }
}
