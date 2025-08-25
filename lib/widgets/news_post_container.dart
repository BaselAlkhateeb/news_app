import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/news_post_model.dart';
import 'package:news_app/pages/post_screen.dart';

class NewsPostContainer extends StatelessWidget {
  const NewsPostContainer({required this.newsPost, super.key});
  final NewsPost newsPost;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen(url: newsPost.url,)));
        },
        child: Container(
            
          width: MediaQuery.sizeOf(context).width,
          height: 380,
          decoration: BoxDecoration(
            border: BoxBorder.all(color: Colors.black , width: 2),
            color: Colors.grey.withAlpha((0.2 * 255).round()),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
 SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 200,
                child: CachedNetworkImage(
                  imageUrl: newsPost.imagePath ??
                      'https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(color: Colors.orange),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: Colors.red),
                ),
              ),

              // SizedBox(
              //   width: MediaQuery.sizeOf(context).width,
              //   height: 200,
              //   child: Image.network(
                  
              //     newsPost.imagePath?? 'https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg' ,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Text(
                newsPost.mainText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              Text(
                newsPost.describtionText??'',
                style: TextStyle(
                  color: const Color.fromARGB(255, 113, 113, 113),
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0 , left: 4),
                child: Text('published at : ${newsPost.publishedDate}' , style: TextStyle(color:Colors.black , fontSize: 10),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
