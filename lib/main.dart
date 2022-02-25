import 'package:flutter/material.dart';

import 'Screens/myCalls.dart';
import 'Screens/myChats.dart';
import 'Screens/myStatus.dart';

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

class _MyHomeState extends State<MyHome> {
  bool onChats = true;
  bool onStatus = false;
  bool onCalls = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
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
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(width, 65),
          child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      tooltip: "Camera",
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 25.0,
                        color: Colors.white60,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              onStatus = false;
                              onCalls = false;
                              onChats = true;
                            });
                          },
                          child: Container(
                            height: 50.0,
                            alignment: Alignment.center,
                            width: width / 4.0,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: onChats
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 2.5,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "CHATS",
                                  style: TextStyle(
                                    color:
                                        onChats ? Colors.white : Colors.white60,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                Container(
                                  alignment: Alignment.center,
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                    color:
                                        onChats ? Colors.white : Colors.white60,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              onStatus = true;
                              onCalls = false;
                              onChats = false;
                            });
                          },
                          child: Container(
                            height: 50.0,
                            alignment: Alignment.center,
                            width: width / 4.0,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: onStatus
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 2.5,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "STATUS",
                                  style: TextStyle(
                                    color: onStatus
                                        ? Colors.white
                                        : Colors.white60,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                Container(
                                  alignment: Alignment.center,
                                  height: 6.0,
                                  width: 6.0,
                                  decoration: BoxDecoration(
                                    color: onStatus
                                        ? Colors.white
                                        : Colors.white60,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              onStatus = false;
                              onCalls = true;
                              onChats = false;
                            });
                          },
                          child: Container(
                            height: 50.0,
                            alignment: Alignment.center,
                            width: width / 4.0,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: onCalls
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 2.5,
                                ),
                              ),
                            ),
                            child: Text(
                              "CALLS",
                              style: TextStyle(
                                color: onCalls ? Colors.white : Colors.white60,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
      body: SafeArea(
        child: onChats
            ? const MyChatsScreen()
            : (onStatus ? const MyStatusScreen() : const MyCallScreen()),
      ),
    );
  }
}
