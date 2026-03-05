import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news/screens/bloc/cubit.dart';
import 'package:news/screens/bloc/states.dart';
import 'package:news/screens/news_data.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(title: Text('News'), centerTitle: true),
        body: BlocProvider(
          create: (context) => HomeCubit()..getSources(),
          child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {
              if (state is GetSourcesLoadingState) {
                context.loaderOverlay.show();
              } else if (state is GetSourcesSuccessState) {
                context.loaderOverlay.hide();
              }
            },
            builder: (context, state) {

              return Column(
                children: [
                  DefaultTabController(
                    length: HomeCubit.get(context).sources.length,
                    initialIndex: HomeCubit.get(context).selectedIndex,
                    child: TabBar(
                      isScrollable: true,
                      padding: EdgeInsets.zero,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      indicatorColor: Color(0xFF171717),
                      labelStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF171717),
                      ),
                      unselectedLabelStyle: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF171717),
                      ),
                      onTap: (index) {
                        HomeCubit.get(context).onTabChanged(index);
                      },
                      tabs:
                      HomeCubit.get(context).sources.map((e) => Tab(text: e.name)).toList(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: NewsData(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
