import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Models/MyChatModel.dart';

class MyIndividualChatPage extends StatefulWidget {
  const MyIndividualChatPage({Key? key, required this.myChatModel})
      : super(key: key);
  final MyChatModel myChatModel;

  @override
  _MyIndividualChatPageState createState() => _MyIndividualChatPageState();
}

class _MyIndividualChatPageState extends State<MyIndividualChatPage> {
  final GlobalKey<PopupMenuButtonState> _key =
      GlobalKey<PopupMenuButtonState>();

  final TextEditingController _textController = TextEditingController();

  bool _isShow = false;
  final FocusNode _myFocusNode = FocusNode();

  _onEmojiSelected(Emoji emoji) {
    _textController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length));
  }

  _onBackspacePressed() {
    _textController
      ..text = _textController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length));
  }

  @override
  void initState() {
    super.initState();
    _myFocusNode.addListener(
      () {
        if (_myFocusNode.hasFocus) {
          setState(() {
            _isShow = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leadingWidth: 70.0,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_back_outlined,
                  size: 24.0,
                ),
                const SizedBox(width: 3.0),
                CircleAvatar(
                  backgroundImage: AssetImage(widget.myChatModel.imgUrl),
                  radius: 20.0,
                  backgroundColor: widget.myChatModel.backColor,
                )
              ],
            ),
          ),
          title: InkWell(
            onTap: () {
              // TODO : show person profile
            },
            child: Container(
              margin: const EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.myChatModel.name,
                    style: const TextStyle(
                      fontSize: 18.5,
                    ),
                  ),
                  const Text(
                    "online",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              tooltip: "Video Call",
              onPressed: () {},
              icon: const Icon(Icons.videocam),
            ),
            IconButton(
              tooltip: "Call",
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),
            PopupMenuButton(
              key: _key,
              tooltip: "More",
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text("View Contact"),
                  ),
                  const PopupMenuItem(
                    child: Text("Media,links, and docs"),
                  ),
                  const PopupMenuItem(
                    child: Text("Search"),
                  ),
                  const PopupMenuItem(
                    child: Text("Mute notifications"),
                  ),
                  const PopupMenuItem(
                    child: Text("Wallpaper"),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      // TODO: open PopupMenuItem with in PopupItem
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("More"),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          margin: const EdgeInsets.only(
                              left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: TextFormField(
                            controller: _textController,
                            focusNode: _myFocusNode,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 6,
                            minLines: 1,
                            cursorColor: const Color(0XFF075E55),
                            decoration: InputDecoration(
                                hintText: "Message",
                                prefixIcon: IconButton(
                                  icon: Icon(
                                    Icons.emoji_emotions,
                                    color: Colors.grey[700],
                                  ),
                                  onPressed: () {
                                    _myFocusNode.unfocus();
                                    _myFocusNode.canRequestFocus = false;
                                    setState(() {
                                      _isShow = !_isShow;
                                    });
                                  },
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 6.0, vertical: 8.0),
                                border: InputBorder.none,
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.attach_file,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5.0, bottom: 8.0, right: 5.0),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 25.0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.mic,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  Offstage(
                    offstage: !_isShow,
                    child: SizedBox(
                      height: 250,
                      child: myEmojiPicker(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ! Emoji Picker wigdet

  Widget myEmojiPicker() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        _onEmojiSelected(emoji);
      },
      onBackspacePressed: _onBackspacePressed,
      config: const Config(
        columns: 7,
        verticalSpacing: 0,
        horizontalSpacing: 0,
        bgColor: Color(0xFFF2F2F2),
        indicatorColor: Colors.blue,
        iconColor: Colors.grey,
        iconColorSelected: Colors.blue,
        progressIndicatorColor: Colors.blue,
        backspaceColor: Colors.blue,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: true,
        showRecentsTab: true,
        recentsLimit: 28,
        noRecentsText: "No Recents",
        noRecentsStyle: TextStyle(fontSize: 20, color: Colors.black26),
        tabIndicatorAnimDuration: kTabScrollDuration,
        categoryIcons: CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,
      ),
    );
  }
}
