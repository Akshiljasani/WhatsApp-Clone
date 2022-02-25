import 'package:flutter/material.dart';

class MyStatusScreen extends StatelessWidget {
  const MyStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const _myListTileStatus(
            imgUrl: "assets/images/akash.jpg",
            isVeiwed: true,
            text: "My Status",
            time: "Today, 7:20 AM",
          ),
          const _myBuildText(text: "Recent updates"),
          const _myListTileStatus(
            imgUrl: "assets/images/user4.jpg",
            isVeiwed: false,
            text: "Saloni",
            time: "Just now",
          ),
          const _myListTileStatus(
            imgUrl: "assets/images/user3.jpg",
            isVeiwed: false,
            text: "Mixer",
            time: "Today, 8:20 AM",
          ),
          _myListTileStatus(
            imgUrl: "assets/images/avatar-1.png",
            isVeiwed: false,
            text: "Lucas",
            time: "Today, 10:02 AM",
            backColor: Colors.red.shade300,
          ),
          _myListTileStatus(
            imgUrl: "assets/images/avatar-2.png",
            isVeiwed: false,
            text: "Olivia",
            time: "Today, 10:02 AM",
            backColor: Colors.green.shade300,
          ),
          const _myListTileStatus(
            imgUrl: "assets/images/user1.jpg",
            isVeiwed: false,
            text: "James",
            time: "Today, 11:02 AM",
          ),
          _myListTileStatus(
            imgUrl: "assets/images/avatar-3.png",
            isVeiwed: false,
            text: "Senorita",
            time: "Today, 11:02 AM",
            backColor: Colors.yellow.shade300,
          ),
          const _myBuildText(text: "Viewed updates"),
          _myListTileStatus(
            imgUrl: "assets/images/avatar-4.png",
            isVeiwed: true,
            text: "Oliver",
            time: "Yesterday, 11:02 AM",
            backColor: Colors.orange.shade300,
          ),
          _myListTileStatus(
            imgUrl: "assets/images/avatar-5.png",
            isVeiwed: true,
            text: "Ava Roy",
            time: "Yesterday, 12:12 PM",
            backColor: Colors.pink.shade300,
          ),
          const _myListTileStatus(
            imgUrl: "assets/images/user8.jpg",
            isVeiwed: true,
            text: "Liam",
            time: "Yesterday, 12:25 PM",
          ),
          _myListTileStatus(
            imgUrl: "assets/images/avatar-6.png",
            isVeiwed: true,
            text: "William",
            time: "Yesterday, 1:58 PM",
            backColor: Colors.blue.shade300,
          ),
          const _myListTileStatus(
            imgUrl: "assets/images/user2.jpg",
            isVeiwed: true,
            text: "Noah",
            time: "Yesterday, 2:25 PM",
          ),
          const SizedBox(height: 70.0)
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.edit,
              color: Colors.blueGrey[700],
              size: 25.0,
            ),
            mini: true,
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(
            height: 15.0,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.camera_alt_rounded),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _myBuildText extends StatelessWidget {
  final String text;

  const _myBuildText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

// ignore: camel_case_types
class _myListTileStatus extends StatelessWidget {
  final String imgUrl;
  final String text;
  final String time;
  final bool isVeiwed;
  final Color? backColor;

  const _myListTileStatus({
    Key? key,
    required this.imgUrl,
    required this.text,
    required this.time,
    required this.isVeiwed,
    this.backColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 100.0,
        width: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isVeiwed ? Colors.grey : Colors.green,
            width: 2.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundColor: backColor,
            backgroundImage: AssetImage(imgUrl),
            radius: 40.0,
          ),
        ),
      ),
      title: Text(text),
      subtitle: Text(time),
    );
  }
}
