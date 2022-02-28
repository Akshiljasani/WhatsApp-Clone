import 'dart:ui';

class MyChatModel {
  final String name;
  final String chat;
  final String time;
  final int msgCount;
  final String imgUrl;
  final Color? backColor;

  MyChatModel({
    required this.name,
    required this.chat,
    required this.time,
    required this.msgCount,
    required this.imgUrl,
    this.backColor,
  });
}
