import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/news_post_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/vertical_list_view.dart';

class VerticalListViewBuilder extends StatefulWidget {
  const VerticalListViewBuilder({super.key ,  this.category , this.q});
  final String? category;
  final String? q;

  @override
  State<VerticalListViewBuilder> createState() =>
      _VerticalListViewBuilderState();
}

class _VerticalListViewBuilderState extends State<VerticalListViewBuilder> {
  
  // ignore: prefer_typing_uninitialized_variables
  var future  ;
  @override
  void initState() {
    super.initState();
    if(widget.category!=null){
    future = NewsService(Dio()).getGeneralNews(widget.category!);
    }
    else{
    future = NewsService(Dio()).searchNews(widget.q!);

    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsPost>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return VerticalListView(newsPostList: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
          
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
                Image.asset('assets/png/error-404 (1).png'),
                SizedBox(height: 10),
                Text(
                  'OPPS there was in error!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
                CircularProgressIndicator(color: Colors.orange),
              ],
            ),
          );
        }
      },
    );
  }
}

//old solution

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app/Models/news_post_model.dart';
// import 'package:news_app/services/news_service.dart';
// import 'package:news_app/widgets/vertical_list_view.dart';

// class VerticalListViewBuilder extends StatefulWidget {
//   const VerticalListViewBuilder({super.key});

//   @override
//   State<VerticalListViewBuilder> createState() => _VerticalListViewState();
// }

// class _VerticalListViewState extends State<VerticalListViewBuilder> {
//   List<NewsPost> newsPostList = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     getGeneralNews();
//   }

//   Future<void> getGeneralNews() async {
//     newsPostList = await NewsService(Dio()).getGeneralNews();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return

//     (isLoading)
//         ? SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
//                 CircularProgressIndicator(color: Colors.orange),
//               ],
//             ),
//           )
//         : (newsPostList.isNotEmpty)
//         ? VerticalListView(newsPostList: newsPostList)
//         : SliverToBoxAdapter(
//             child: Column(
//               children: [
//                SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
//                 Image.asset('assets/png/error-404 (1).png' , ),
//                 SizedBox(height: 10,),
//                 Text('OPPS there was in error!' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
//               ],
//             ),
//           );
//   }
// }
