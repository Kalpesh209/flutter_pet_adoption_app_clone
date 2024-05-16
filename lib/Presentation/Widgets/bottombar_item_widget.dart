import 'package:flutter/material.dart';
import 'package:flutter_pet_adoption_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItemWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;
  const BottomBarItemWidget(
    this.icon, {
    this.onTap,
    this.color = Colors.black,
    this.activeColor = AppColors.primary,
    this.isActive = false,
    this.isNotified = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isActive
                    ? AppColors.primary.withOpacity(.1)
                    : Colors.transparent,
              ),
              child: SvgPicture.asset(
                icon,
                color: isActive ? activeColor : color,
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
