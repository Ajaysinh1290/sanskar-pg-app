import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanskar_pg_app/models/review/review.dart';
import 'package:sanskar_pg_app/models/user/user_model.dart';
import 'package:sanskar_pg_app/screens/widgets/image/image_network.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(review.userId)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          UserModel? user;
          if (snapshot.hasData) {
            user = UserModel.fromJson(snapshot.data.data());
          }

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: user == null
                      ? Container(
                          width: 35.w,
                          height: 35.w,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              shape: BoxShape.circle),
                        )
                      : ImageNetwork(
                          imageUrl: user.userProfilePic!,
                          width: 35.w,
                          height: 35.w,
                        ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          user == null
                              ? Shimmer.fromColors(
                                  highlightColor: Colors.grey[300]!,
                                  baseColor: Colors.grey[200]!,
                                  child: Container(
                                    width: 120.w,
                                    height: 18.h,
                                    color: Theme.of(context).cardColor,
                                  ),
                                )
                              : Text(
                                  user.userName,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                          Text(
                            Constants.onlyDateFormat.format(review.reviewTime),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      if (review.rating != null)
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: RatingBarIndicator(
                            rating: review.rating!,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            unratedColor: Colors.amber.withOpacity(0.3),
                            itemCount: 5,
                            itemPadding: EdgeInsets.only(right: 6.w),
                            itemSize: 22.0.sp,
                          ),
                        ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        review.description ?? '',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
