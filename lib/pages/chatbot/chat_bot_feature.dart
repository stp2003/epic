import 'package:epic/pages/chatbot/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/chat_controller.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat with Shayak',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.8,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller.textC,
                textAlign: TextAlign.center,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                  fillColor: Colors.green,
                  filled: true,
                  isDense: true,
                  hintText: 'Ask me anything you want...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.teal,
              child: IconButton(
                onPressed: _controller.askQuestion,
                icon: const Icon(
                  Icons.rocket_launch_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          controller: _controller.scrollC,
          padding:
              EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
          children:
              _controller.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
