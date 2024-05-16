import 'package:flutter/material.dart';
import 'package:flutter_pet_adoption_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationBoxWidget extends StatelessWidget {
  const NotificationBoxWidget({
    Key? key,
    this.onTap,
    this.notifiedNumber = 0,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final int notifiedNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.appBarColor,
          border: Border.all(color: Colors.grey.withOpacity(.3)),
        ),
        child: notifiedNumber > 0
            ? Badge(
                backgroundColor: AppColors.actionColor,
                child: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  width: 25,
                  height: 25,
                ),
              )
            : SvgPicture.asset("assets/icons/bell.svg"),
      ),
    );
  }
}
