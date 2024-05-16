import 'package:flutter/material.dart';
import 'package:flutter_pet_adoption_app_clone/AppUtils/app_constants.dart';
import 'package:flutter_pet_adoption_app_clone/Presentation/Widgets/chat_item_widget.dart';
import 'package:flutter_pet_adoption_app_clone/Presentation/Widgets/custom_textbox_widget.dart';

class ChatPageScreen extends StatefulWidget {
  const ChatPageScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPageScreen> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildChats(),
        ],
      ),
    );
  }

  _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 60, 15, 5),
      child: Column(
        children: const [
          Text(
            "Chats",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          CustomTextBoxWidget(
            hint: "Search",
            prefix: Icon(Icons.search, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  _buildChats() {
    return ListView(
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      children: List.generate(
        AppConstants.chats.length,
        (index) => ChatItemWidget(
          AppConstants.chats[index],
          onTap: null,
        ),
      ),
    );
  }
}
