// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/activities.dart';
import 'package:flutter_application_1/admin.page/description_page.dart';

class ActivitiesWidget extends StatelessWidget {
  final Activities activities;
  const ActivitiesWidget({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DescriptionPage(activities: activities),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: NetworkImage(activities.image), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(width: 6),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activities.name,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
