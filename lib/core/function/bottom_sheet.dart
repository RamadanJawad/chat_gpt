// import 'package:chat_gpt/core/constant/color.dart';
// import 'package:chat_gpt/view/widgets/drop_down.dart';
// import 'package:chat_gpt/view/widgets/text_widget.dart';
// import 'package:flutter/material.dart';

// class Services {
//   static Future<void> showModalSheet({required BuildContext context}) async {
//     await showModalBottomSheet(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(20),
//           ),
//         ),
//         backgroundColor: ColorApp.scaffoldBackgroundColor,
//         context: context,
//         builder: (context) {
//           return Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 Flexible(
//                   child: TextWidget(
//                     label: "Chosen Model:",
//                     fontSize: 16,
//                   ),
//                 ),
//                 Flexible(flex: 2, child: ModelsDrowDownWidget()),
//               ],
//             ),
//           );
//         });
//   }
// }