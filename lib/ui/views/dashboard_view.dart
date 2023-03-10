import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authFormProvider).user;
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "DashBoard View",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          WhiteCard(
            title: user!.nombre,
            child: Text(user.correo),
          )
        ],
      ),
    );
  }
}
