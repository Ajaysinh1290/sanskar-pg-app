import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';
import 'package:sanskar_pg_app/models/food/food.dart';
import 'package:sanskar_pg_app/screens/widgets/cards/food_card.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:sanskar_pg_app/utils/images/image_storage.dart';
import 'package:shimmer/shimmer.dart';

class Foods extends StatelessWidget {
  const Foods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 30.sp,
              color: Colors.black,
            )),
        title: Text(
          'Canteen Food',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('hostels')
              .doc(Get.find<HostelController>().hostel?.hostelId)
              .collection('foods')
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            List<Food>? foods;
            if (snapshot.hasData) {
              List data = snapshot.data.docs;
              foods = [];
              for (var element in data) {
                foods.add(Food.fromJson(element.data()));
              }
            }

            return foods == null
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[100]!,
                    highlightColor: Colors.grey[200]!,
                    child: GridView.builder(
                      itemCount: 10,
                      padding: Constants.scaffoldPaddingWithoutSafeArea,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 20.w,
                          crossAxisSpacing: 20.w),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  )
                : foods.isEmpty
                    ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 130.h,
                            ),
                            LottieBuilder.asset(
                              ImageStorage.lottieAnimations.notFound,
                              height: 350.h,
                              repeat: false,
                            ),
                            Text(
                              'No Foods Found..!',
                              style: Theme.of(context).textTheme.headline3,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    : GridView.builder(
                        itemCount: foods.length,
                        shrinkWrap: true,
                        padding: Constants.scaffoldPaddingWithoutSafeArea,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.82,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 30),
                        itemBuilder: (context, index) {
                          return FoodCard(food: foods![index]);
                        });
          }),
    );
  }
}
