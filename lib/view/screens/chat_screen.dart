import 'dart:developer';
import 'package:chat_gpt/controller/chat_controller.dart';
import 'package:chat_gpt/core/constant/color.dart';
import 'package:chat_gpt/core/constant/images.dart';
import 'package:chat_gpt/core/function/send_message.dart';
import 'package:chat_gpt/view/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../widgets/text_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(ImageUrl.openaiLogo),
          ),
          title: const Text("ChatGPT"),
        ),
        body: GetBuilder<ChatController>(
          init: ChatController(),
          builder: (controller) {
            return SafeArea(
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                        controller: controller.listScrollController,
                        itemCount:
                            controller.getChatList.length, //chatList.length,
                        itemBuilder: (context, index) {
                          return ChatWidget(
                            msg: controller
                                .getChatList[index].msg, // chatList[index].msg,
                            chatIndex: controller.getChatList[index]
                                .chatIndex, //chatList[index].chatIndex,
                            shouldAnimate:
                                controller.getChatList.length - 1 == index,
                          );
                        }),
                  ),
                  if (controller.isTyping) ...[
                    const SpinKitThreeBounce(
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: ColorApp.cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              focusNode: controller.focusNode,
                              style: const TextStyle(color: Colors.white),
                              controller: controller.textEditingController,
                              onSubmitted: (value) async {
                                await controller.sendMessageFCT(
                                    controller: controller);
                              },
                              decoration: const InputDecoration.collapsed(
                                  hintText: "How can I help you",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                await controller.sendMessageFCT(
                                    controller: controller);
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
