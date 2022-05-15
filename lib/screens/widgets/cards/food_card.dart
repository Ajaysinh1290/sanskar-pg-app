import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sanskar_pg_app/models/food/food.dart';
import 'package:sanskar_pg_app/screens/food/food_details.dart';
import 'package:sanskar_pg_app/screens/widgets/image/image_network.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(FoodDetails(foodId: food.foodId),
            transition: Transition.rightToLeft);
      },
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: food.foodImage == null
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
                  : ImageNetwork(
                      imageUrl: food.foodImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            food.foodName,
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
