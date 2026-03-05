import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/views/app_drawer.dart';
import 'package:news/screens/views/categories_view.dart';
import 'package:news/screens/views/sources_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        drawer: AppDrawer(onDrawerClicked: onDrawerClicked,),
        appBar: AppBar(title: Text(selectedCategory != null ? selectedCategory!.label : 'News'), centerTitle: true),
        body: selectedCategory == null ? CategoriesView(onCategoryClicked: onCategoryClicked,) : SourcesView(categoryId: selectedCategory!.id),
      ),
    );
  }

  void onDrawerClicked() {
    setState(() {
      selectedCategory = null;
      Navigator.pop(context);
    });
  }


  void onCategoryClicked(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
