import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study/chatting/chat/message.dart';
import 'package:study/chatting/chat/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  void getCurrentUser(){
    final user = _authentication.currentUser;

    if(user != null){
      loggedUser = user;
      print(loggedUser!.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat screen'),
        actions: [
          IconButton(
              onPressed: (){
                _authentication.signOut();
              },
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              )
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Messages(),
            ),
            NewMessage()
          ],
        ),
      ),
    );
  }
}
