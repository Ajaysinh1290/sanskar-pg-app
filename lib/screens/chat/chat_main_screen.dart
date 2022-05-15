import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/animation/fade_and_translate_animation.dart';
import 'package:sanskar_pg_app/screens/chat/chat_with_admin.dart';
import 'package:sanskar_pg_app/screens/chat/group_chat.dart';
import 'package:sanskar_pg_app/utils/utils.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({Key? key}) : super(key: key);

  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: Constants.scaffoldPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FadeAnimationTranslateY(
                delay: 1.0,
                child: Image.asset(
                  ImageStorage.illustrations.chat,
                  height: 309.h,
                  width: 355.w,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              FadeAnimationTranslateY(
                delay: 1.2,
                child: SizedBox(
                  width: 300.w,
                  child: Column(
                    children: [
                      Text(
                        Constants.chatTitle,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Constants.chatSubTitle,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              FadeAnimationTranslateY(
                delay: 1.4,
                child: GestureDetector(
                  onTap: () =>Get.to(const GroupChat()),
                  child: Container(
                    height: 80.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Text(Constants.groupChatButtonText,
                        style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              FadeAnimationTranslateY(
                delay: 1.6,
                child: GestureDetector(
                  onTap: () =>Get.to(const ChatWithAdmin()),
                  child: Container(
                    height: 80.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Text(Constants.chatWithAdminButtonText,
                        style: Theme.of(context)
                            .textTheme
                            .headline3)
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
