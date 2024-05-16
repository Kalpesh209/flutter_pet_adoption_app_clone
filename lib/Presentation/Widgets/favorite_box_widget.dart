import 'package:flutter/material.dart';
import 'package:flutter_pet_adoption_app_clone/AppUtils/app_colors.dart';

class FavoriteBoxWidget extends StatelessWidget {
  const FavoriteBoxWidget({
    Key? key,
    this.bgColor = AppColors.red,
    this.onTap,
    this.isFavorited = false,
    this.borderColor = Colors.transparent,
    this.radius = 50,
    this.size = 20,
  }) : super(key: key);

  final Color borderColor;
  final Color? bgColor;
  final bool isFavorited;
  final double radius;
  final double size;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isFavorited ? bgColor : AppColors.primary,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: isFavorited
            ? Icon(
                Icons.favorite,
                color: Colors.white,
                size: size,
              )
            : Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: size,
              ),
      ),
    );
  }
}
