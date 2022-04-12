import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/Buisness/cubit/cubit/app_cubit.dart';
import 'package:test/Buisness/cubit/news_cubit.dart';

class NewsHomeScreens extends StatelessWidget {
  const NewsHomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getAllBuisnessData(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    AppCubit.get(context).convertTheme();
                  },
                  icon: const Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),
            body: cubit.pages[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.bottomNavBar(index: index),
              items: cubit.items,
            ),
          );
        },
      ),
    );
  }
}
