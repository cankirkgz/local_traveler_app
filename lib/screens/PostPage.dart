import 'package:flutter/material.dart';
import 'package:local_traveler_app/screens/CreatePost.dart';
import 'package:local_traveler_app/widgets/Post.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Yerel Gezgin",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              size: 40,
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePost()),
              );
            },
          ),
        ],
      ),
      body: const Column(
        children: [
          Post(
            imageUrl:
                "https://images.pexels.com/photos/18533502/pexels-photo-18533502/free-photo-of-peyzaj-gun-batimi-adam-insanlar.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            profileImageUrl:
                "https://images.pexels.com/photos/3772509/pexels-photo-3772509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            username: "Mehtap Kırkgöz",
            sharedLocation: "Moda sahili",
          ),
          Post(
            imageUrl:
                "https://images.pexels.com/photos/12167768/pexels-photo-12167768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            profileImageUrl:
                "https://images.pexels.com/photos/12809804/pexels-photo-12809804.jpeg?auto=compress&cs=tinysrgb&w=600",
            username: "Mehmet Sakallı",
            sharedLocation: "İzmir Talat Kahvaltı Salonu",
          ),
        ],
      ),
    );
  }
}
