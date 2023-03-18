import 'package:chat_gpt/core/theme/service_theme.dart';
import 'package:chat_gpt/view/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      home:const ChatScreen(),
    );
  }
}
