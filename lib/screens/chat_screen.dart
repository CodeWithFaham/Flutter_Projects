import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  final List<String> chats = [
    "Muhammad Ahmed ",
    "Faizan Abdul Wahid",
    "Muhammad Farhan",
    "Abdul Aziz Patel",
    "Hassan Raza",
    "Sana Mir",
    "Ali Haider",
    "Omar Siddiqui",
    "Yasir Khan",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,

      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(
                chats[index][0],
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(chats[index]),
            subtitle: Text("Hey! How are you?"),
            trailing: Text("2:30 PM"),
            onTap: () {
              ScaffoldMessenger.of( context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.blueAccent,
                  content: Text("Tapped on ${chats[index]}")),
              );
              Future.delayed(
                const Duration(seconds: 3), () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                    content: Text("Welcome to chat with ${chats[index]}"),
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}