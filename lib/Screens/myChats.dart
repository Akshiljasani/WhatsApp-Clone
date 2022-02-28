import 'package:flutter/material.dart';

import '../Models/MyChatModel.dart';
import '../MyCustomWidgets/CustomCard.dart';

class MyChatsScreen extends StatefulWidget {
  const MyChatsScreen({Key? key}) : super(key: key);

  @override
  State<MyChatsScreen> createState() => _MyChatsScreenState();
}

class _MyChatsScreenState extends State<MyChatsScreen> {
  List<MyChatModel> chats = [
    MyChatModel(
      name: "Mixer",
      chat: "Hii...",
      msgCount: 2,
      time: "10:00 AM",
      imgUrl: "assets/images/user3.jpg",
    ),
    MyChatModel(
      name: "Lucas",
      chat: "What are you doning, bro",
      msgCount: 5,
      time: "10:05 AM",
      imgUrl: "assets/images/avatar-1.png",
      backColor: Colors.red.shade300,
    ),
    MyChatModel(
      name: "Unknown",
      chat: "...",
      msgCount: 8,
      time: "3:00 PM",
      imgUrl: "assets/images/default.jpg",
    ),
    MyChatModel(
      name: "Saloni",
      chat: "How are you ?",
      msgCount: 2,
      time: "11:00 PM",
      imgUrl: "assets/images/user4.jpg",
    ),
    MyChatModel(
      name: "James",
      chat: "hye Brother",
      msgCount: 5,
      time: "10:30 AM",
      imgUrl: "assets/images/user1.jpg",
    ),
    MyChatModel(
      name: "William",
      chat: "when you come here bor ...",
      msgCount: 1,
      time: "5:30 PM",
      imgUrl: "assets/images/avatar-6.png",
      backColor: Colors.blue.shade300,
    ),
    MyChatModel(
      name: "Olivia",
      chat: "My brother with you ?",
      msgCount: 6,
      time: "7:30 PM",
      imgUrl: "assets/images/avatar-2.png",
      backColor: Colors.green.shade300,
    ),
    MyChatModel(
      name: "Senorita",
      chat: "hello...",
      msgCount: 4,
      time: "9:47 PM",
      imgUrl: "assets/images/avatar-3.png",
      backColor: Colors.yellow.shade300,
    ),
    MyChatModel(
      name: "Oliver",
      chat: "when you come in clg ?",
      msgCount: 2,
      time: "9:47 PM",
      imgUrl: "assets/images/avatar-4.png",
      backColor: Colors.orange.shade300,
    ),
    MyChatModel(
      name: "Big Brother 😎",
      chat: "Come home fast ...",
      msgCount: 15,
      time: "11:47 PM",
      imgUrl: "assets/images/user6.jpg",
    ),
    MyChatModel(
      name: "Noah",
      chat: "You want to play game ?",
      msgCount: 3,
      time: "9:13 PM",
      imgUrl: "assets/images/user2.jpg",
    ),
    MyChatModel(
      name: "Ava Roy",
      chat: "What are you doning ??",
      msgCount: 6,
      time: "10:45 PM",
      imgUrl: "assets/images/avatar-5.png",
      backColor: Colors.pink.shade300,
    ),
    MyChatModel(
      name: "Liam",
      chat: "Please solve this problem",
      msgCount: 4,
      time: "4:45 PM",
      imgUrl: "assets/images/user8.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return MyCustomCard(
            myChatModel: chats[index],
          );
        },
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
