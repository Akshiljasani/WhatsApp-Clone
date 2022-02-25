import 'package:flutter/material.dart';

class MyCallScreen extends StatelessWidget {
  const MyCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _myListTileCalls(
            imgUrl: "assets/images/user3.jpg",
            title: "Mixer",
            subTitle: "Today, 3:26 PM",
            backColor: Colors.blue.shade300,
            isRecived: true,
            makeCall: false,
            isVideoCall: true,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/avatar-1.png",
            title: "Lucas",
            subTitle: "Today, 7:05 AM",
            backColor: Colors.red.shade300,
            isRecived: true,
            makeCall: false,
            isVideoCall: true,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/avatar-6.png",
            title: "William",
            subTitle: "Yesterday, 8:05 PM",
            backColor: Colors.blue.shade300,
            isRecived: false,
            makeCall: false,
            isVideoCall: false,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/avatar-2.png",
            title: "Olivia",
            subTitle: "February 10, 10:55 AM",
            backColor: Colors.green.shade300,
            isRecived: true,
            makeCall: false,
            isVideoCall: true,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/user1.jpg",
            title: "James",
            subTitle: "February 8, 9:15 PM",
            backColor: Colors.grey.shade300,
            isRecived: false,
            makeCall: true,
            isVideoCall: false,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/avatar-1.png",
            title: "Lucas",
            subTitle: "February 2, 8:05 AM",
            backColor: Colors.red.shade300,
            isRecived: true,
            makeCall: false,
            isVideoCall: true,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/user3.jpg",
            title: "Mixer",
            subTitle: "January 29, 2:45 PM",
            backColor: Colors.blue.shade300,
            isRecived: false,
            makeCall: true,
            isVideoCall: false,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/avatar-4.png",
            title: "Oliver",
            subTitle: "January 26, 4:45 PM",
            backColor: Colors.orange.shade300,
            isRecived: false,
            makeCall: false,
            isVideoCall: true,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/avatar-5.png",
            title: "Ava Roy",
            subTitle: "January 26, 3:45 PM",
            backColor: Colors.pink.shade300,
            isRecived: false,
            makeCall: true,
            isVideoCall: true,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/avatar-2.png",
            title: "Olivia",
            subTitle: "January 24, 11:55 AM",
            backColor: Colors.green.shade300,
            isRecived: false,
            makeCall: false,
            isVideoCall: false,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/user2.jpg",
            title: "Noah",
            subTitle: "January 23, 9:15 PM",
            backColor: Colors.grey.shade300,
            isRecived: true,
            makeCall: false,
            isVideoCall: false,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/user4.jpg",
            title: "Saloni",
            subTitle: "January 22, 10:15 PM",
            backColor: Colors.grey.shade300,
            isRecived: true,
            makeCall: false,
            isVideoCall: true,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/user8.jpg",
            title: "Liam",
            subTitle: "January 20, 10:15 AM",
            backColor: Colors.grey.shade300,
            isRecived: false,
            makeCall: true,
            isVideoCall: false,
          ),
          _myListTileCalls(
            imgUrl: "assets/images/avatar-3.png",
            title: "Senorita",
            subTitle: "January 18, 11:55 PM",
            backColor: Colors.yellow.shade300,
            isRecived: true,
            makeCall: false,
            isVideoCall: true,
          ),
          const SizedBox(height: 70.0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add_call,
          size: 25.0,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _myListTileCalls extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subTitle;
  final Color backColor;
  final bool isRecived;
  final bool makeCall;
  final bool isVideoCall;

  const _myListTileCalls({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.subTitle,
    required this.backColor,
    required this.isRecived,
    required this.makeCall,
    required this.isVideoCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: backColor,
        backgroundImage: AssetImage(imgUrl),
        radius: 25.0,
      ),
      title: Text(title),
      subtitle: Row(
        children: [
          Icon(
            isRecived
                ? Icons.call_received
                : (makeCall ? Icons.call_made_outlined : Icons.call_received),
            color: isRecived
                ? Colors.green
                : (makeCall ? Colors.green : Colors.red),
            size: 18.0,
          ),
          const SizedBox(width: 3.0),
          Text(subTitle)
        ],
      ),
      trailing: Icon(
        isVideoCall ? Icons.videocam : Icons.call,
        color: Theme.of(context).primaryColor,
        size: 28.0,
      ),
    );
  }
}
