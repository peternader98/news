import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/api_manager.dart';
import 'package:news/models/sources_response.dart';
import 'package:news/screens/news_data.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  HomeScreen({super.key});

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News'), centerTitle: true),
      body: FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          } else {
            SourcesResponse? data = snapshot.data;
            return Column(
              children: [
                DefaultTabController(
                  length: data?.sources?.length ?? 0,
                  initialIndex: selectedIndex,
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
                      selectedIndex = index;
                    },
                    tabs:
                        data?.sources?.map((e) => Tab(text: e.name)).toList() ??
                        [],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: NewsData(sourceId: data?.sources?[selectedIndex].id ?? '',),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
