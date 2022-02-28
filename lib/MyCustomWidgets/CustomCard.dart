import 'package:flutter/material.dart';
import 'package:whatsapp_demo/Models/MyChatModel.dart';

import '../Screens/individualChatPage.dart';

class MyCustomCard extends StatelessWidget {
  const MyCustomCard({Key? key, required this.myChatModel}) : super(key: key);
  final MyChatModel myChatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MyIndividualChatPage(myChatModel: myChatModel),
          ),
        );
      },
      child: ListTile(
        leading: InkWell(
          onTap: () {
            // TODO : show user profile picture
            print(myChatModel.name);
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(myChatModel.imgUrl),
            radius: 25.0,
            backgroundColor: myChatModel.backColor,
          ),
        ),
        title: Text(myChatModel.name),
        subtitle: Row(
          children: [
            const Icon(
              Icons.done_all,
              size: 14.0,
              color: Colors.lightBlue,
            ),
            const SizedBox(width: 3.0),
            Text(
              myChatModel.chat,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myChatModel.time,
              style: const TextStyle(
                fontSize: 11.0,
              ),
            ),
            const SizedBox(height: 3.0),
            CircleAvatar(
              radius: 10.0,
              child: Text(
                myChatModel.msgCount.toString(),
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
