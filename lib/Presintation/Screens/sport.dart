import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/Buisness/cubit/news_cubit.dart';
import 'package:test/Presintation/Screens/web_view.dart';
import 'package:test/Presintation/Widget/custome_card.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var data = NewsCubit.get(context).sport;
        return ConditionalBuilder(
          condition: state is! GetSportDataLoading,
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          builder: (context) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CustomeCard(
                  image: data[index]['urlToImage'],
                  title: data[index]['title'],
                  date: data[index]['publishedAt'],
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WebViewScreen(url: data[index]['url'])));
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
