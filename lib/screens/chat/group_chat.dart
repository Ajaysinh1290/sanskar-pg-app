import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';
import 'package:sanskar_pg_app/controllers/user_controller.dart';
import 'package:sanskar_pg_app/models/chat/chat_model.dart';
import 'package:sanskar_pg_app/models/user/user_model.dart';
import 'package:sanskar_pg_app/screens/widgets/image/full_images.dart';
import 'package:sanskar_pg_app/screens/widgets/image/image_network.dart';
import 'package:sanskar_pg_app/screens/widgets/image/pick_image.dart';
import 'package:sanskar_pg_app/services/notification_service.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class GroupChat extends StatefulWidget {
  const GroupChat({Key? key}) : super(key: key);

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  final TextEditingController chatController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Get.find<UserController>().user!;
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
        title: Text(
          'Group Chat',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<Object>(
                stream: FirebaseFirestore.instance
                    .collection('hostels')
                    .doc(Get.find<HostelController>().hostel!.hostelId)
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
                                    chat.sentBy == 'admin'
                                        ? Text(
                                            'Admin',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.sp),
                                          )
                                        : chat.sentBy == userModel.userId
                                            ? const SizedBox()
                                            : StreamBuilder<Object>(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection('users')
                                                    .doc(chat.sentBy)
                                                    .snapshots(),
                                                builder: (context,
                                                    AsyncSnapshot snapshot) {
                                                  UserModel? userModel;
                                                  if (snapshot.hasData) {
                                                    userModel =
                                                        UserModel.fromJson(
                                                            snapshot.data
                                                                .data());
                                                  }
                                                  return userModel == null
                                                      ? Shimmer.fromColors(
                                                          baseColor: Colors
                                                              .grey.shade300,
                                                          highlightColor:
                                                              Colors.white,
                                                          child: Container(
                                                            width: 200.w,
                                                            height: 35.h,
                                                            color: Colors
                                                                .grey.shade100,
                                                          ),
                                                        )
                                                      : Text(
                                                          userModel.userName,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline5!
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      16.sp),
                                                        );
                                                }),
                                    SizedBox(
                                      height: 10.h,
                                    ),
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
                                                    color: Colors.grey.shade200,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(8.r)),
                                            child: Text(chat.message,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6),
                                          ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
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
                                sentTo: 'group',
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
                                  .collection('hostels')
                                  .doc(Get.find<HostelController>()
                                      .hostel!
                                      .hostelId)
                                  .collection('chats')
                                  .doc(chatModel.chatId)
                                  .set(chatModel.toJson());
                              await NotificationService.sendNotification(
                                  'Group Chat - ' +
                                      Get.find<UserController>().user!.userName,
                                  'Sent a Photo',
                                  {'screen': 'group_chat'},
                                  Get.find<HostelController>().hostel!.hostelId,
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
                                      sentTo: 'group',
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
                                        .collection('hostels')
                                        .doc(Get.find<HostelController>()
                                            .hostel!
                                            .hostelId)
                                        .collection('chats')
                                        .doc(chatModel.chatId)
                                        .set(chatModel.toJson());
                                    await NotificationService.sendNotification(
                                        'Group Chat - ' +
                                            Get.find<UserController>()
                                                .user!
                                                .userName,
                                        chatModel.message,
                                        {'screen': 'group_chat'},
                                        Get.find<HostelController>()
                                            .hostel!
                                            .hostelId);
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
