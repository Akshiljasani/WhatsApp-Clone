import 'package:flutter/material.dart';

class MyChatsScreen extends StatelessWidget {
  const MyChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const _myListTileChat(
            name: "Mixer",
            chat: "Hii...",
            msgCount: 2,
            time: "10:00 AM",
            imgUrl: "assets/images/user3.jpg",
          ),
          _myListTileChat(
            name: "Lucas",
            chat: "What are you doning, bro ...",
            msgCount: 5,
            time: "10:05 AM",
            imgUrl: "assets/images/avatar-1.png",
            backColor: Colors.red.shade300,
          ),
          const _myListTileChat(
            name: "Unknown",
            chat: "...",
            msgCount: 8,
            time: "3:00 PM",
            imgUrl: "assets/images/default.jpg",
          ),
          const _myListTileChat(
            name: "Saloni",
            chat: "How are you ?",
            msgCount: 2,
            time: "11:00 PM",
            imgUrl: "assets/images/user4.jpg",
          ),
          const _myListTileChat(
            name: "James",
            chat: "hye Brother",
            msgCount: 5,
            time: "10:30 AM",
            imgUrl: "assets/images/user1.jpg",
          ),
          _myListTileChat(
            name: "William",
            chat: "when you come here bor ...",
            msgCount: 1,
            time: "5:30 PM",
            imgUrl: "assets/images/avatar-6.png",
            backColor: Colors.blue.shade300,
          ),
          _myListTileChat(
            name: "Olivia",
            chat: "My brother with you ?",
            msgCount: 6,
            time: "7:30 PM",
            imgUrl: "assets/images/avatar-2.png",
            backColor: Colors.green.shade300,
          ),
          _myListTileChat(
            name: "Senorita",
            chat: "hello...",
            msgCount: 4,
            time: "9:47 PM",
            imgUrl: "assets/images/avatar-3.png",
            backColor: Colors.yellow.shade300,
          ),
          _myListTileChat(
            name: "Oliver",
            chat: "when you come in college ??",
            msgCount: 2,
            time: "9:47 PM",
            imgUrl: "assets/images/avatar-4.png",
            backColor: Colors.orange.shade300,
          ),
          const _myListTileChat(
            name: "Big Brother 😎",
            chat: "Come home fast ...",
            msgCount: 15,
            time: "11:47 PM",
            imgUrl: "assets/images/user8.jpg",
          ),
          const _myListTileChat(
            name: "Noah",
            chat: "You want to play game ?",
            msgCount: 3,
            time: "9:13 PM",
            imgUrl: "assets/images/user2.jpg",
          ),
          _myListTileChat(
            name: "Ava Roy",
            chat: "What are you doning ??",
            msgCount: 6,
            time: "10:45 PM",
            imgUrl: "assets/images/avatar-5.png",
            backColor: Colors.pink.shade300,
          ),
          const _myListTileChat(
            name: "Liam",
            chat: "Please solve this problem 😭",
            msgCount: 4,
            time: "4:45 PM",
            imgUrl: "assets/images/user8.jpg",
          ),
          const SizedBox(height: 70.0)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.message,
          size: 25.0,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _myListTileChat extends StatelessWidget {
  final String name;
  final String chat;
  final String time;
  final int msgCount;
  final String imgUrl;
  final Color? backColor;

  const _myListTileChat({
    Key? key,
    required this.name,
    required this.chat,
    required this.time,
    required this.msgCount,
    required this.imgUrl,
    this.backColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imgUrl),
        radius: 25.0,
        backgroundColor: backColor,
      ),
      title: Text(name),
      subtitle: Text(chat),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: const TextStyle(
              fontSize: 11.0,
            ),
          ),
          const SizedBox(height: 3.0),
          CircleAvatar(
            radius: 10.0,
            child: Text(
              msgCount.toString(),
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
