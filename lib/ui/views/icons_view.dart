import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "View",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                title: "ac_unit_outlined",
                width: 170,
                child: Icon(Icons.ac_unit_outlined),
              ),
              WhiteCard(
                title: "access_alarm_outlined",
                width: 170,
                child: Icon(Icons.access_alarm_outlined),
              ),
              WhiteCard(
                title: "access_time_outlined",
                width: 170,
                child: Icon(Icons.access_time_outlined),
              ),
              WhiteCard(
                title: "all_inbox_outlined",
                width: 170,
                child: Icon(Icons.all_inbox_outlined),
              ),
              WhiteCard(
                title: "flash_on_outlined",
                width: 170,
                child: Icon(Icons.flash_on_outlined),
              ),
              WhiteCard(
                title: "admin_panel_settings_outlined",
                width: 170,
                child: Icon(Icons.admin_panel_settings_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
