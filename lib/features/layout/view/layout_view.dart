import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/layout/manger/layout_cubit.dart';
import 'package:sakkiny/features/layout/manger/layout_states.dart';
import 'package:sakkiny/features/layout/view/widgets/bottom_nav_bar.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: cubit.currentIndex,
              children: cubit.bottomViewsBody,
            ),
          ),
          bottomNavigationBar: BottomNavBar(layoutCubit: cubit),
        );
      },
    );
  }
}
