import 'package:flutter/material.dart';

class Minggu02 extends StatefulWidget {
  const Minggu02({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Minggu02State createState() => _Minggu02State();
}

class _Minggu02State extends State<Minggu02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout - Chat'),
      ),
      body: Column(
        children: [
          // Container(
          //   child: BoxDecoration(

          //   ),
          // ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: const [
                MessageBubble(
                    text: 'Hi, how are you?',
                    isMe: true,
                    time: "04/04/2023 16:09"),
                MessageBubble(
                    text: 'I am fine, thanks for asking.',
                    isMe: false,
                    time: "04/04/2023 16:09"),
                MessageBubble(
                    text: 'What are you doing today?',
                    isMe: true,
                    time: "04/04/2023 16:09"),
                MessageBubble(
                    text: 'Nothing much, just relaxing at home.',
                    isMe: false,
                    time: "04/04/2023 16:10"),
                MessageBubble(
                    text: 'How about you?',
                    isMe: false,
                    time: "04/04/2023 16:10"),
                MessageBubble(
                    text: 'I am working on a new project.',
                    isMe: true,
                    time: "04/04/2023 16:10"),
                MessageBubble(
                    text: 'That sounds interesting.',
                    isMe: false,
                    time: "04/04/2023 16:10"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;

  const MessageBubble(
      {super.key, required this.text, required this.isMe, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                  bottomLeft: isMe
                      ? const Radius.circular(20.0)
                      : const Radius.circular(0),
                  bottomRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(20.0),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      color: isMe ? Colors.white : Colors.black,
                    ),
                  ),
                  const Divider(),
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 12.0,
                        color: isMe ? Colors.white : Colors.black),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
