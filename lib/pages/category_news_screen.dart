import 'package:flutter/material.dart';
import 'package:news_app/widgets/vertical_listview_builder.dart';

class CategoryNewsScreen extends StatelessWidget {
  const CategoryNewsScreen({super.key , required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('$categoryName News' , style: TextStyle(color: Colors.orange , fontWeight: FontWeight.bold , fontSize: 18),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [

              VerticalListViewBuilder(category:categoryName )
            ],
          ),
        ),
      ),
    );
  }
}