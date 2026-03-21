import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/features/home/domain/use_case/delete_todo_use_case.dart';
import 'package:to_do_app/features/home/presentaion/ui_screens/detail_todo.dart';
import 'package:to_do_app/features/home/data/data_source/home_data_source_impl.dart';
import 'package:to_do_app/features/home/data/repo/home_repo_impl.dart';
import 'package:to_do_app/features/home/domain/use_case/create_todo_use_case.dart';
import 'package:to_do_app/features/home/domain/use_case/get_todo_use_case.dart';
import 'package:to_do_app/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:to_do_app/features/home/presentaion/widgets/home_widgets/custom_container_modal_sheet.dart';
import '../../domain/use_case/edit_todo_use_case.dart';
import '../widgets/home_widgets/appbar_home_addtodo.dart';
import '../widgets/home_widgets/custom_container_add.dart';
import '../widgets/home_widgets/custom_container_add_shimmer.dart';

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({super.key});

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: AppColor.kWhite,
        appBar: AppbarHomeAddtodo(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if(state is HomeGetTodoLoading){
              return CustomContainerAddShimmer();
            }else if(state is HomeGetTodoSuccess){
              var todos = state.todoModel;
              if (todos.isEmpty){
                return Center(child: Lottie.asset('assets/animations/History.json'));
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 80.h),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomContainerAdd(todo: todos[index],isPrimary: index==0,
                        onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>DetailTodo(todo: todos[index]))
                        );
                        },
                         );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 21.h,),
                    itemCount: todos.length),
              );
            }else {
              return Container(color: Colors.red,);

            }
          },
        ),
        floatingActionButton:
        FloatingActionButton(
          heroTag: "addTask",
          backgroundColor: AppColor.kPurple,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
              return BlocProvider(
                create: (context) =>
                    HomeCubit(
                        CreateTodoUseCase(
                            HomeRepoImpl(HomeRemoteDataSourceImpl())),
                        GetTodoUseCase(
                            HomeRepoImpl(HomeRemoteDataSourceImpl())),
                    DeleteTodoUseCase(
                      HomeRepoImpl(HomeRemoteDataSourceImpl())),
                      EditTodoUseCase(HomeRepoImpl(HomeRemoteDataSourceImpl())),),
                child: CustomContainerModalSheet(
                  titleController: titleController,
                  descriptionController: desController,
                  deadLineController: deadLineController,
                  addImageController: imageController,
                ),
              );
            },).then((value) {
              context.read<HomeCubit>().getTodo();
              titleController.clear();
              desController.clear();
              deadLineController.clear();
              imageController.clear();
            },);
          },
          child:  Icon(Icons.add, size: 32.h, color: AppColor.kWhite,),)

    );
  }
}
