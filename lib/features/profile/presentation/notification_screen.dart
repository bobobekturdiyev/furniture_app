import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/config/resources/app_icons.dart';
import 'package:furniture_app/config/state/notification_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, String>> data = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPJbLVWNjCmBtwM27bB9u75SeAxSTSve0gKQ&s",
      "title": "Sarlavha 1",
      "subtitle": "Subtitle 1",
      "time": "20m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSptiZXJXMA7_FUAtijqvnrYwhgRCnTuMKBg&s",
      "title": "Sarlavha 2",
      "subtitle": "Subtitle 2",
      "time": "30m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPJbLVWNjCmBtwM27bB9u75SeAxSTSve0gKQ&s",
      "title": "Sarlavha 1",
      "subtitle": "Subtitle 1",
      "time": "20m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSptiZXJXMA7_FUAtijqvnrYwhgRCnTuMKBg&s",
      "title": "Sarlavha 2",
      "subtitle": "Subtitle 2",
      "time": "30m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPJbLVWNjCmBtwM27bB9u75SeAxSTSve0gKQ&s",
      "title": "Sarlavha 1",
      "subtitle": "Subtitle 1",
      "time": "20m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSptiZXJXMA7_FUAtijqvnrYwhgRCnTuMKBg&s",
      "title": "Sarlavha 2",
      "subtitle": "Subtitle 2",
      "time": "30m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPJbLVWNjCmBtwM27bB9u75SeAxSTSve0gKQ&s",
      "title": "Sarlavha 1",
      "subtitle": "Subtitle 1",
      "time": "20m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSptiZXJXMA7_FUAtijqvnrYwhgRCnTuMKBg&s",
      "title": "Sarlavha 2",
      "subtitle": "Subtitle 2",
      "time": "30m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPJbLVWNjCmBtwM27bB9u75SeAxSTSve0gKQ&s",
      "title": "Sarlavha 1",
      "subtitle": "Subtitle 1",
      "time": "20m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSptiZXJXMA7_FUAtijqvnrYwhgRCnTuMKBg&s",
      "title": "Sarlavha 2",
      "subtitle": "Subtitle 2",
      "time": "30m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPJbLVWNjCmBtwM27bB9u75SeAxSTSve0gKQ&s",
      "title": "Sarlavha 1",
      "subtitle": "Subtitle 1",
      "time": "20m ago",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSptiZXJXMA7_FUAtijqvnrYwhgRCnTuMKBg&s",
      "title": "Sarlavha 2",
      "subtitle": "Subtitle 2",
      "time": "30m ago",
    },
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationModel>().open();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F7),
      appBar: AppBar(
        title: Text("Notification"),
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SvgPicture.asset(
              AppIcons.arrowLeft,
              width: 24,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFF5F6F7),
        centerTitle: true,
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => getNotificationElement(
            image: data[index]["image"]!,
            title: data[index]["title"]!,
            subtitle: data[index]["subtitle"]!,
            time: data[index]["time"]!),
        itemCount: data.length,
      ),
    );
  }

  Widget getNotificationElement({
    required String image,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(13)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(13),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(
                image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  subtitle,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Text(
            time,
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 7,
            ),
          ),
        ],
      ),
    );
  }
}
