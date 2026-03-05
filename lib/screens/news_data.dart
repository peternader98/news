import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news/screens/bloc/cubit.dart';
import 'package:news/screens/bloc/states.dart';
import 'package:news/screens/widgets/articleItem.dart';

class NewsData extends StatelessWidget {

  const NewsData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is GetNewsLoadingState) {
          context.loaderOverlay.show();
        } else if (state is GetNewsSuccessState) {
          context.loaderOverlay.hide();
        }
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: HomeCubit.get(context).articles.length,
          itemBuilder: (context, index) {

            return Articleitem(article: HomeCubit.get(context).articles[index]);
          },
        );
      },
    );
  }
}
