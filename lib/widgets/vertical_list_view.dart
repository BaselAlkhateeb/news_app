
import 'package:flutter/material.dart';
import 'package:news_app/Models/news_post_model.dart';

import 'package:news_app/widgets/news_post_container.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({super.key  , required this.newsPostList });

final List<NewsPost> newsPostList ;



  @override
  Widget build(BuildContext context) {
    return  SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: newsPostList.length,
              (context, index) =>
                  NewsPostContainer(newsPost: newsPostList[index]),
            ),
          );
  }
}
