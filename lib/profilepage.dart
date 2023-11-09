import 'package:aplikasi/homepage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
        ),
        backgroundColor: Colors.black,
      ),
      body: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int friend = 5;

  List<String> images = [
    'https://akcdn.detik.net.id/community/media/visual/2023/10/31/lionel-messi-2_169.jpeg?w=600&q=90',
    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj2O0AHnrvGwqhPKoIt9CgvdK3zxvTw_h2Nw-5ahABMDPf8SvohmuUkW8jc2yXOXMCfvJUgkQjOsbmglBf_dh7aznqPTLBsBzWEHGfqMqvyAFVUiWh9axydshro8bfZKVz55yPu7Q1y1VzFw615uTiabMWFpocEcZGZT4t_xfup4Sjn5XNrfH0ypqU5/s600/b29a6a903ceffc06-600x338.jpg',
    'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2023/06/09/42-alex-rins_lg99107gallery_ful-20230609020812.jpg',
    'https: media.vanityfair.com/photos/64a57415fa3d2f4f2b8958e0/master/w_2560%2Cc_limit/1511418315',
    'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt3a49d84fc6489998/60db4c0790ef0d39a2fcee5a/fcd9b766bc07ed7607df941d8b67223930c8eed9.jpg?auto=webp&format=pjpg&width=3840&quality=60'
  ];

  List<String> names = [
    'Messi',
    'Brock',
    'Rins',
    'Tom',
    'Muller',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(padding: EdgeInsets.zero, children: <Widget>[
      SizedBox(height: 50),
      profileImage(70,
          'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'),
      SizedBox(height: 20),
      description(),
      SizedBox(height: 40),
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27.0, bottom: 10),
              child: Text(
                "Friend List ($friend)",
                style: TextStyle(fontSize: 25, fontFamily: 'ChakraPetch'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: friend,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          profileImage(40, images[index]),
                          SizedBox(height: 8),
                          Text(
                            names[index],
                            style: TextStyle(
                                fontSize: 18, fontFamily: 'ChakraPetch'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 20),
      Center(
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      )
    ]));
  }

  Widget profileImage(double sizeRadius, String linkImage) => CircleAvatar(
        radius: sizeRadius,
        backgroundColor: Colors.grey.shade800,
        child: ClipOval(
          child: Image.network(
            linkImage,
            fit: BoxFit.cover,
            width: sizeRadius * 2,
            height: sizeRadius * 2,
          ),
        ),
      );

  Widget description() => Column(
        children: [
          const SizedBox(height: 8),
          Text(
            'Rafi Putra Darmawan',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'ChakraPetch'),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '152021082',
            style: TextStyle(fontSize: 24, fontFamily: 'ChakraPetch'),
          )
        ],
      );
}
