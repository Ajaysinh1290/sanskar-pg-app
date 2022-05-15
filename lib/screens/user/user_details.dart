import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/animation/fade_and_translate_animation.dart';
import 'package:sanskar_pg_app/controllers/user_controller.dart';
import 'package:sanskar_pg_app/models/room/room.dart';
import 'package:sanskar_pg_app/models/user/user_model.dart';
import 'package:sanskar_pg_app/screens/widgets/image/full_image.dart';
import 'package:sanskar_pg_app/screens/widgets/image/full_images.dart';
import 'package:sanskar_pg_app/screens/widgets/image/image_network.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class UserDetails extends StatelessWidget {
  final String userId;

  const UserDetails({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? user = Get.find<UserController>().user;
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'User Profile ',
            style: Theme.of(context).textTheme.headline3,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: Constants.scaffoldPaddingWithoutSafeArea,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FadeAnimationTranslateY(
                    delay: 1.0,
                    child: Hero(
                      tag: user!.userId,
                      child: GestureDetector(
                        onTap: () => Get.to(FullImage(
                          heroTag: user.userId,
                          imageUrl: user.userProfilePic!,
                        )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: ImageNetwork(
                            imageUrl: user.userProfilePic!,
                            width: 110.w,
                            height: 110.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.w,
                ),
                Center(
                  child: FadeAnimationTranslateY(
                    delay: 1.2,
                    child: Text(
                      user.userName,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(letterSpacing: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                FadeAnimationTranslateY(
                  delay: 1.6,
                  child: Text(
                    'Personal Information',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                FadeAnimationTranslateY(
                  delay: 1.8,
                  child: Text(
                    'User Name',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FadeAnimationTranslateY(
                  delay: 2.0,
                  child: Text(user.userName,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 2.2,
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 2.4,
                  child: Text(
                    'Email',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FadeAnimationTranslateY(
                  delay: 2.6,
                  child: Text(
                    user.email,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 2.8,
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 3.0,
                  child: Text(
                    'Mobile Number',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FadeAnimationTranslateY(
                  delay: 3.2,
                  child: Text(
                    user.mobileNumber!,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 3.4,
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 3.6,
                  child: Text(
                    'Gender',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FadeAnimationTranslateY(
                  delay: 3.8,
                  child: Text(
                    user.gender,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 2.2,
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 3.6,
                  child: Text(
                    'Address',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FadeAnimationTranslateY(
                  delay: 3.8,
                  child: Text(
                    '${user.address.street}, ${user.address.city}, ${user.address.state}, ${user.address.pinCode}',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                StreamBuilder<Object>(
                    stream: FirebaseFirestore.instance
                        .collection('hostels')
                        .doc(user.hostelId)
                        .collection('rooms')
                        .doc(user.roomHistory.last.roomId)
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      Room? room;
                      if (snapshot.hasData) {
                        room = Room.fromJson(snapshot.data.data());
                      }
                      return room == null
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[100]!,
                              highlightColor: Colors.grey[200]!,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Container(
                                    height: 40.h,
                                    color: Theme.of(context).cardColor,
                                    width: 200.w,
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Container(
                                    height: 60.h,
                                    color: Theme.of(context).cardColor,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Container(
                                    height: 60.h,
                                    color: Theme.of(context).cardColor,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Container(
                                    height: 60.h,
                                    color: Theme.of(context).cardColor,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50.h,
                                ),
                                FadeAnimationTranslateY(
                                  delay: 4.0,
                                  child: Text(
                                    'Room Information',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                FadeAnimationTranslateY(
                                  delay: 4.2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Wing',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .dividerColor),
                                      ),
                                      Text(
                                        room.wing,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                FadeAnimationTranslateY(
                                  delay: 4.4,
                                  child: Container(
                                    width: double.infinity,
                                    height: 2,
                                    color: Theme.of(context).cardColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                FadeAnimationTranslateY(
                                  delay: 4.6,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Floor',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .dividerColor),
                                      ),
                                      Text(
                                        room.floor.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                FadeAnimationTranslateY(
                                  delay: 4.8,
                                  child: Container(
                                    width: double.infinity,
                                    height: 2,
                                    color: Theme.of(context).cardColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                FadeAnimationTranslateY(
                                  delay: 5.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Room',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .dividerColor),
                                      ),
                                      Text(
                                        room.roomNumber.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                    }),
                SizedBox(
                  height: 50.h,
                ),
                FadeAnimationTranslateY(
                  delay: 5.2,
                  child: Text(
                    'ID Proof',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                FadeAnimationTranslateY(
                  delay: 5.4,
                  child: SizedBox(
                    height: 100.w,
                    child: ListView.builder(
                      itemCount: user.documents.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.to(FullImages(
                            imageUrls: user.documents,
                            initialImage: index,
                          )),
                          child: Container(
                            width: 100.w,
                            margin: EdgeInsets.only(right: 15.w),
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                    width: 0.5)),
                            child: Hero(
                              tag: user.documents[index],
                              child: ImageNetwork(
                                imageUrl: user.documents[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                FadeAnimationTranslateY(
                  delay: 5.6,
                  child: Text(
                    'Referral Details',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                FadeAnimationTranslateY(
                  delay: 5.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Points',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Theme.of(context).dividerColor),
                      ),
                      Text(
                        (user.points ?? 0).toString(),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 6.0,
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 6.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Referral Code',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Theme.of(context).dividerColor),
                      ),
                      Text(
                        (user.referId ?? '-').toString(),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 6.4,
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 6.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Referred By',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Theme.of(context).dividerColor),
                      ),
                      Text(
                        (user.referredBy ?? '-').toString(),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 6.6,
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                FadeAnimationTranslateY(
                  delay: 6.8,
                  child: Text(
                    'Referrals',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Theme.of(context).dividerColor),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                user.referred == null ||
                        user.referred != null && user.referred!.isEmpty
                    ? FadeAnimationTranslateY(
                        delay: 7.0,
                        child: Center(
                          child: Text(
                            "No reference Found",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: user.referred!.length,
                        itemBuilder: (context, index) {
                          return StreamBuilder<Object>(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(user.referred![index])
                                  .snapshots(),
                              builder: (context, AsyncSnapshot snapshot) {
                                UserModel? referredUser;
                                if (snapshot.hasData) {
                                  referredUser =
                                      UserModel.fromJson(snapshot.data.data());
                                }
                                return referredUser == null
                                    ? Container()
                                    : FadeAnimationTranslateY(
                                        delay: 7.0 + (index * 0.2),
                                        child: FadeAnimationTranslateY(
                                          delay: 1.0 + (index * 0.2),
                                          child: ListTile(
                                            onTap: () {
                                              String userId =
                                                  referredUser!.userId;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UserDetails(
                                                              userId: userId)));
                                            },
                                            leading: ClipOval(
                                              child: ImageNetwork(
                                                imageUrl: referredUser
                                                    .userProfilePic!,
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            title: Text(
                                              referredUser.userName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            subtitle: Padding(
                                              padding:
                                                  EdgeInsets.only(top: 5.h),
                                              child: Text(
                                                referredUser.email,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                              });
                        },
                      )
              ],
            ),
          ),
        ));
  }
}
