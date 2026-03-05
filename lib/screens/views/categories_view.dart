import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';

class CategoriesView extends StatelessWidget {

  Function onCategoryClicked;

  CategoriesView({required this.onCategoryClicked, super.key});

  List<CategoryModel> category = CategoryModel.categories('light');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Good Morning \n Here is Some News For You',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xFF171717),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: category.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onCategoryClicked(category[index]);
              },
              child: Stack(
                alignment: index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      category[index].image,
                      fit: BoxFit.cover,
                      height: 198,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(category[index].label,),
                        Image.asset(
                          index % 2 == 0 ?
                          'assets/images/light_right_arrow.png'
                          :'assets/images/light_left_arrow.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
