import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership_project/ui/widgets/loader_widget/cubit/loader_view_cubit.dart';
import 'package:intership_project/ui/widgets/loader_widget/loader_widget.dart';
import 'package:intership_project/ui/widgets/main_screen/main_screen.dart';
import 'package:intership_project/ui/widgets/order_screen/order_screen.dart';

class ScreenFactory {
  Widget makeLoader() {
    return BlocProvider<LoaderViewCubit>(
      create: (context) => LoaderViewCubit(),
      child: const LoaderWidget(),
    );
  }

  Widget makeMainScreen() {
    return const MainScreen();
  }

  Widget makeOrderScreen() {
    return const OrderScreen();
  }
}
