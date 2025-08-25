import 'package:flutter/material.dart';
import 'package:news_app/Models/category_model.dart';
import 'package:news_app/pages/category_news_screen.dart';


class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    required this.category,
    super.key,
  });
final Category category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNewsScreen(categoryName: category.name)));
        //VerticalListViewBuilder(category: category.name,);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 180,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10) , 
            image: DecorationImage(image: AssetImage(category.imagePath) , fit: BoxFit.cover)
          ),
          child: Center(child: Container(
            color: Colors.white.withAlpha((0.3*255).round()),
            
            child: Text(category.name , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold),))),
        ),
      ),
    );
  }
}
