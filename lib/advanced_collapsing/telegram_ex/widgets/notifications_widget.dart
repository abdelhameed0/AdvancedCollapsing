import 'package:flutter/material.dart';

import '../telegram_constants/telegram_constants.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  NotificationsWidgetState createState() => NotificationsWidgetState();
}

class NotificationsWidgetState extends State<NotificationsWidget> {
  bool isOn = false;

  void setNotificationsState(bool value) {
    setState(() {
      isOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: leftPadding,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(isOn ? 'On' : 'Off',
                    style: const TextStyle(color: Colors.grey))
              ],
            ),
            Switch(
              value: isOn,
              onChanged: setNotificationsState,
              activeColor: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
