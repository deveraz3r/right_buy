import 'package:flutter/material.dart';
import 'package:rightbuy/Widgets/reusable_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  Map data = {
    "image": "assets/images/boycott_image.jpg",
    "desc": "this is a description, this is a description, this is a description, this is a description,"
        "this is a description, this is a description, this is a description, this is a description,"
        "this is a description, this is a description, this is a description, this is a description,"
        "this is a description, this is a description, this is a description, this is a description,"
        "this is a description, this is a description, this is a description, this is a description,"
        ""
        ""
        "this is a description, this is a description, this is a description, this is a description,",
    "story": "this is a story, this is a story, this is a story, this is a story, this is a story, this is a story, this is a story,"
        "this is a story, this is a story, this is a story, this is a story, this is a story, this is a story, this is a story,"
        "this is a story, this is a story, this is a story, this is a story, this is a story, this is a story, this is a story,"
        "this is a story, this is a story, this is a story, this is a story, this is a story, this is a story, this is a story,"
        "this is a story, this is a story, this is a story, this is a story, this is a story, this is a story, this is a story,",
    "link": "https://www.dog.com/"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "News",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     IconButton(onPressed: () {}, icon: Icon(Icons.home)),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
      //   ],
      //   backgroundColor: Colors.green,
      // ),
      appBar: ReusableAppBar(
        titleText: "News",
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              )
          ),
          IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              )
          )
        ],
        enableBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(

                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/boycott_image.jpg',
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Boycotts of israel",
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'popin',
                    fontWeight: FontWeight.w700,
                    color: Colors.green,
                  )),
              SizedBox(
                height: 5,
              ),
              Text(
                "${data['desc']}",
                style: const TextStyle(fontFamily: 'popin'),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Story",
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'popin',
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  )),
              SizedBox(
                height: 5,
              ),
              Text(
                "${data['story']}",
                style: const TextStyle(fontFamily: 'popin'),
              ),
              SizedBox(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text(
                    "${data['link']}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.blue),
                  ),
                  icon: Icon(
                    Icons.link,
                    color: Colors.grey,
                  ),
                ),
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
