import 'package:flutter/material.dart';
import 'package:news_app/widgets/vertical_listview_builder.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key , required this.q});
  final String q;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("news related to '$q' " , style: TextStyle(color: Colors.orange , fontWeight: FontWeight.bold , fontSize: 18),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [

              VerticalListViewBuilder(q: q, )
            ],
          ),
        ),
      ),
    );
  }
}