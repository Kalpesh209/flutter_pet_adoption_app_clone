import 'package:flutter/material.dart';
import 'package:flutter_pet_adoption_app_clone/AppUtils/app_colors.dart';

import 'custom_image_widget.dart';
import 'notify_box_widget.dart';

class ChatItemWidget extends StatelessWidget {
  final chatData;
  final bool isNotified;
  final GestureTapCallback? onTap;
  final double profileSize;
  const ChatItemWidget(
    this.chatData, {
    Key? key,
    this.onTap,
    this.isNotified = true,
    this.profileSize = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildPhoto(),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  buildNameAndTime(),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextAndNotified(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextAndNotified() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            chatData['last_text'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13),
          ),
        ),
        if (isNotified)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: NotifyBox(
              number: chatData['notify'],
              boxSize: 17,
              color: AppColors.red,
            ),
          )
      ],
    );
  }

  Widget _buildPhoto() {
    return CustomImageWidget(
      chatData['image'],
      width: profileSize,
      height: profileSize,
    );
  }

  Widget buildNameAndTime() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            chatData['name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          chatData['date'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
