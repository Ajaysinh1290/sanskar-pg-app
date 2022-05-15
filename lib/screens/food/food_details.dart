import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/animation/fade_and_translate_animation.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';
import 'package:sanskar_pg_app/models/food/food.dart';
import 'package:sanskar_pg_app/models/review/review.dart';
import 'package:sanskar_pg_app/screens/food/widgets/review_tile.dart';
import 'package:sanskar_pg_app/screens/widgets/image/image_network.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';

class FoodDetails extends StatelessWidget {
  final String foodId;

  const FoodDetails({Key? key, required this.foodId}) : super(key: key);

  double _countRating(List<Review>? reviews) {
    if (reviews == null) return 5.0;
    double rating = 0;

    for (Review review in reviews) {
      rating = review.rating ?? 5;
    }
    return rating;
  }

  @override
  Widget build(BuildContext context) {
    Food? food;
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
          'Food Details',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('hostels')
              .doc(Get.find<HostelController>().hostel!.hostelId)
              .collection('foods')
              .doc(foodId)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              food = Food.fromJson(snapshot.data.data());
            }
            return food == null
                ? Container()
                : ListView(
                    padding: Constants.scaffoldPaddingWithoutSafeArea,
                    children: [
                      FadeAnimationTranslateY(
                        delay: 1.0,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: food!.foodImage == null
                                ? Container(
                                    width: 175.w,
                                    height: 175.w,
                                    color: Theme.of(context).cardColor,
                                    child: Icon(
                                      Icons.fastfood,
                                      size: 30.sp,
                                      color: Colors.black,
                                    ),
                                  )
                                : Hero(
                                    tag: foodId,
                                    child: ImageNetwork(
                                      imageUrl: food!.foodImage!,
                                      width: 175.w,
                                      height: 175.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      FadeAnimationTranslateY(
                        delay: 1.2,
                        child: Center(
                          child: Text(
                            food!.foodName,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      FadeAnimationTranslateY(
                        delay: 1.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${Constants.currencySymbol}${food!.price}',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 30.sp,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  _countRating(food!.reviews).toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontWeight: FontWeight.normal),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      FadeAnimationTranslateY(
                        delay: 1.6,
                        child: Text(
                          '${food!.description!.isEmpty ? 'No Description Found.' : food!.description}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      FadeAnimationTranslateY(
                        delay: 1.8,
                        child: Text(
                          'Reviews',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      food!.reviews == null || food!.reviews!.isEmpty
                          ? FadeAnimationTranslateY(
                              delay: 2.0,
                              child: Text(
                                'No Reviews Found',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.grey),
                              ),
                            )
                          : Column(
                              children: food!.reviews!
                                  .map((review) => ReviewTile(
                                        review: review,
                                      ))
                                  .toList(),
                            )
                    ],
                  );
          }),
    );
  }
}
