import 'package:flutter/material.dart';
import 'package:flutter_pet_adoption_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItemWidget extends StatelessWidget {
  final data;
  final bool selected;
  final GestureTapCallback? onTap;
  const CategoryItemWidget({
    Key? key,
    required this.data,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
        margin: EdgeInsets.only(right: 10),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: selected ? AppColors.secondary : AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              data["icon"],
              width: 35,
              height: 35,
              color: selected ? Colors.white : Colors.black,
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                data["name"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: selected ? Colors.white : AppColors.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
