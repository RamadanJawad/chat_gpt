import 'package:chat_gpt/core/api/api_service.dart';
import 'package:chat_gpt/core/theme/service_theme.dart';
import 'package:chat_gpt/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  List<ChatModel> chatList = [];
  String currentModel = "gpt-3.5-turbo-0301";
  late TextEditingController textEditingController;
  late ScrollController listScrollController;
  bool isTyping = false;
  late FocusNode focusNode;
  late Widget icon;

  void check() {
    ThemeService().isSavedDarkMode()
        ? icon = Icon(Icons.dark_mode_rounded)
        : icon = Icon(Icons.light_mode);
    update();
  }

  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    update();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String chosenModelId}) async {
    if (chosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll(await ApiService.sendMessageGPT(
        message: msg,
        modelId: chosenModelId,
      ));
    } else {
      chatList.addAll(await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
      ));
    }
    update();
  }
  void scrollListToEND() {
    listScrollController.animateTo(
        listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  @override
  void onInit() {
    check();
    super.onInit();
    listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
  }
}
