import 'package:flutter/material.dart';
import 'package:news_app/pages/search_screen.dart';
import 'package:news_app/widgets/horizontal_list_view.dart';
import 'package:news_app/widgets/vertical_listview_builder.dart';

TextEditingController controller = TextEditingController();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: myAppBar(context),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: HorizontalListView()),

              SliverToBoxAdapter(child: SizedBox(height: 30)),

              VerticalListViewBuilder(category: 'general'),
            ],
          ),
        ),
      ),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('News', style: TextStyle(fontWeight: FontWeight.bold)),

              Text(
                'Cloud',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: TextField(
              controller: controller,

              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search...',
                hintStyle: TextStyle(fontSize: 14),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(q: value),
                    ),
                  );
                  controller.clear(); // 🟢 يفرغ النص بعد البحث
                  FocusScope.of(context).unfocus(); // 🟢 يخفي الكيبورد
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
