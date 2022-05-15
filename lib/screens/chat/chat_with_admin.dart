import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/controllers/user_controller.dart';
import 'package:sanskar_pg_app/models/chat/chat_model.dart';
import 'package:sanskar_pg_app/models/user/user_model.dart';
import 'package:sanskar_pg_app/screens/user/user_details.dart';
import 'package:sanskar_pg_app/screens/widgets/image/full_images.dart';
import 'package:sanskar_pg_app/screens/widgets/image/image_network.dart';
import 'package:sanskar_pg_app/screens/widgets/image/pick_image.dart';
import 'package:sanskar_pg_app/services/notification_service.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:sanskar_pg_app/utils/theme/color_palette.dart';

class ChatWithAdmin extends StatefulWidget {
  const ChatWithAdmin({Key? key}) : super(key: key);

  @override
  State<ChatWithAdmin> createState() => _ChatWithAdminState();
}

class _ChatWithAdminState extends State<ChatWithAdmin> {
  final TextEditingController chatController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  readByUser(ChatModel chatModel, String userId) {
    chatModel.readBy = [userId];
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chats')
        .doc(chatModel.chatId)
        .set(chatModel.toJson());
  }

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = Get.find<UserController>().user;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: InkWell(
            onTap: () {
              Get.to(UserDetails(userId: userModel!.userId));
            },
            child: Text(
              'Admin',
              style: Theme.of(context).textTheme.headline4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<Object>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userModel!.userId)
                    .collection('chats')
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  List<ChatModel>? chats;
                  if (snapshot.hasData) {
                    chats = [];
                    for (var element in snapshot.data.docs) {
                      chats.add(ChatModel.fromJson(element.data()));
                    }
                  }
                  return !snapshot.hasData
                      ? const Center(child: SizedBox())
                      : ListView.builder(
                          padding: EdgeInsets.all(20.0.w),
                          itemCount: (chats?.length) ?? 0,
                          controller: scrollController,
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          itemBuilder: (context, index) {
                            ChatModel chat = chats![chats.length - 1 - index];
                            bool? isReadByAdmin;
                            if (chat.sentBy == 'admin') {
                              bool isReadByUser = chat.readBy != null &&
                                  chat.readBy!.contains(userModel.userId);
                              if (!isReadByUser) {
                                readByUser(chat, userModel.userId);
                              }
                            } else {
                              isReadByAdmin = chat.readBy != null &&
                                  chat.readBy!.contains('admin');
                              print('isReadByAdmin : $isReadByAdmin');
                            }
                            return Align(
                              alignment: chat.sentBy == userModel.userId
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Column(
                                  crossAxisAlignment:
                                      chat.sentBy == userModel.userId
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                  children: [
                                    chat.isMedia
                                        ? GestureDetector(
                                            onTap: () {
                                              List<String> imageUrls = [];
                                              int initialImage = 0;
                                              for (ChatModel tempChat
                                                  in chats!) {
                                                if (tempChat.isMedia) {
                                                  imageUrls
                                                      .add(tempChat.message);
                                                }
                                                if (tempChat.chatId ==
                                                    chat.chatId) {
                                                  initialImage =
                                                      imageUrls.length - 1;
                                                }
                                              }
                                              Get.to(FullImages(
                                                  imageUrls: imageUrls,
                                                  initialImage: initialImage));
                                              // Get.to(FullImage(
                                              //     imageUrl: chat.message,
                                              //     heroTag: chat.message));
                                            },
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  minHeight: 100.h,
                                                  maxHeight: 300.h),
                                              child: Hero(
                                                  tag: chat.message,
                                                  child: ImageNetwork(
                                                    imageUrl: chat.message,
                                                    fit: BoxFit.contain,
                                                  )),
                                            ))
                                        : Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.h,
                                                horizontal: 20.w),
                                            decoration: BoxDecoration(
                                                color: chat.sentBy ==
                                                        userModel.userId
                                                    ? Theme.of(context)
                                                        .cardColor
                                                    : Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey.shade100,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(8.r)),
                                            child: Text(
                                              chat.message,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1.5),
                                            ),
                                          ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: chat.sentBy != 'admin'
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          Constants.onlyTimeFormat
                                              .format(chat.messageSentOn),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.5,
                                                  color: Colors.grey.shade400,
                                                  fontSize: 12.sp),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        if (chat.sentBy != 'admin')
                                          isReadByAdmin != null && isReadByAdmin
                                              ? Icon(
                                                  Icons.done_all,
                                                  color: Colors.blue.shade300,
                                                  size: 18.sp,
                                                )
                                              : Icon(
                                                  Icons.done,
                                                  color: ColorPalette.grey,
                                                  size: 18.sp,
                                                )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                }),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade100,
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: chatController,
                    decoration: InputDecoration(
                        hintText: 'Type a Message...!',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red[100]!)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[200]!),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: Theme.of(context).textTheme.subtitle1,
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            File? image = await pickImage();
                            if (image != null) {
                              String chatId = DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString();
                              isLoading.value = true;
                              String imageUrl = await FirebaseStorage.instance
                                  .ref('chats/' + chatId + ".jpg")
                                  .putData(
                                      await image.readAsBytes(),
                                      SettableMetadata(
                                          contentType: 'image/jpeg'))
                                  .then((storage) async {
                                return await storage.ref.getDownloadURL();
                              });
                              ChatModel chatModel = ChatModel(
                                sentBy: userModel.userId,
                                sentTo: userModel.userId,
                                message: imageUrl,
                                messageSentOn: DateTime.now(),
                                chatId: chatId,
                                isMedia: true,
                              );
                              isLoading.value = false;
                              scrollController.animateTo(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                              chatController.text = '';
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(userModel.userId)
                                  .collection('chats')
                                  .doc(chatModel.chatId)
                                  .set(chatModel.toJson());
                              await NotificationService.sendNotification(
                                  'Message From ' +
                                      Get.find<UserController>().user!.userName,
                                  'Sent a Photo',
                                  {
                                    'screen': 'chat_with_user',
                                    'user_id':
                                        Get.find<UserController>().user!.userId
                                  },
                                  'admin',
                                  imageUrl: imageUrl);
                            }
                          },
                          child: Icon(
                            Icons.image_outlined,
                            color: Colors.grey.shade500,
                          ),
                        )),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: ValueListenableBuilder<bool>(
                      valueListenable: isLoading,
                      builder: (context, isLoading, _) {
                        return isLoading
                            ? Padding(
                                padding: EdgeInsets.all(13.0.w),
                                child: const CircularProgressIndicator(
                                  strokeWidth: 3,
                                  backgroundColor: Colors.white54,
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                              )
                            : InkWell(
                                onTap: () async {
                                  if (chatController.text.trim().isNotEmpty) {
                                    ChatModel chatModel = ChatModel(
                                      sentBy: userModel.userId,
                                      sentTo: userModel.userId,
                                      message: chatController.text.trim(),
                                      messageSentOn: DateTime.now(),
                                      chatId: DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString(),
                                      isMedia: false,
                                    );
                                    scrollController.animateTo(0,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                    chatController.text = '';
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(userModel.userId)
                                        .collection('chats')
                                        .doc(chatModel.chatId)
                                        .set(chatModel.toJson());
                                    await NotificationService.sendNotification(
                                        'Message From ' +
                                            Get.find<UserController>()
                                                .user!
                                                .userName,
                                        chatModel.message,
                                        {
                                          'screen': 'chat_with_user',
                                          'user_id': Get.find<UserController>()
                                              .user!
                                              .userId
                                        },
                                        'admin');
                                  }
                                },
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 22.sp,
                                ),
                              );
                      }),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
