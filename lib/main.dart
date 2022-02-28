import 'package:flutter/material.dart';
import 'package:whatsapp_demo/Screens/myCalls.dart';
import 'package:whatsapp_demo/Screens/myCamera.dart';
import 'package:whatsapp_demo/Screens/myChats.dart';
import 'package:whatsapp_demo/Screens/myStatus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
        primaryColor: const Color(0XFF075E55),
        indicatorColor: const Color(0xffffffff),
      ),
      home: const MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  late TabController _myController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cameraWidth = width / 24;
    double yourWidth = (width - cameraWidth) / 5;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Whatsapp",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            tooltip: "search",
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          PopupMenuButton(
            tooltip: "More options",
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text("New group"),
                ),
                const PopupMenuItem(
                  child: Text("New broadcast"),
                ),
                const PopupMenuItem(
                  child: Text("Linked devices"),
                ),
                const PopupMenuItem(
                  child: Text("Starred messages"),
                ),
                const PopupMenuItem(
                  child: Text("Payments"),
                ),
                const PopupMenuItem(
                  child: Text("Settigns"),
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: _myController,
          indicatorColor: Colors.white,
          labelPadding: EdgeInsets.symmetric(
              horizontal: (width - (cameraWidth + yourWidth * 3)) / 8),
          isScrollable: true,
          tabs: [
            SizedBox(
              width: cameraWidth,
              child: const Tab(
                icon: Icon(Icons.camera_alt),
              ),
            ),
            SizedBox(
              width: yourWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Tab(
                    text: "CHATS",
                  ),
                  const SizedBox(width: 5.0),
                  Container(
                    alignment: Alignment.center,
                    height: 17.0,
                    width: 17.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "8",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: yourWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Tab(
                    text: "STATUS",
                  ),
                  const SizedBox(width: 5.0),
                  Container(
                    height: 7.0,
                    width: 7.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: yourWidth,
              child: const Tab(
                text: "CALLS",
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _myController,
        children: const [
          MyCameraScreen(),
          MyChatsScreen(),
          MyStatusScreen(),
          MyCallScreen()
        ],
      ),
    );
  }
}
