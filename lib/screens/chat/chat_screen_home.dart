import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chatpage.dart';
import 'message_page_screen.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>  with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('GET CONNECTED'),
      backgroundColor: Colors.blue,
      centerTitle: true,
      bottom: TabBar(
        controller: controller,
        tabs: const [
          Tab(text: 'PEER CHAT'),
          Tab(text: 'GROUP CHAT')
        ],
      ),
    ),
    body: TabBarView(
      controller: controller,
      children: [
        const MessagesScreen(),
        chatpage(email: '${FirebaseAuth.instance.currentUser!.email}'),
      ],
    ),
  );
}


