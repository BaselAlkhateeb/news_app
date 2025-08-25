import 'package:flutter/material.dart';
import 'package:news_app/Models/category_model.dart';
import 'package:news_app/widgets/category_container.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
  
  });

  final List<Category> categorysList = const[
  Category(imagePath: 'assets/png/business.png', name: 'Business'),
  Category(imagePath: 'assets/png/health.png', name: 'Health'),
  Category(imagePath: 'assets/png/sport.png', name: 'Sports'),
  Category(imagePath: 'assets/png/entertainment.png', name: 'Entertainment'),
  Category(imagePath: 'assets/png/technology.png', name: 'Technology'),
  Category(imagePath: 'assets/png/science.png', name: 'Science'),
  Category(imagePath: 'assets/png/generalNews.png', name: 'General'),

];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorysList.length,
        itemBuilder: (context, index) {
          return CategoryContainer(category: categorysList[index]);
        },
      ),
    );
  }
}