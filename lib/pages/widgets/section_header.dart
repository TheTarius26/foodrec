import 'package:flutter/material.dart';
import 'package:foodrec/common.dart';
import 'package:foodrec/style.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(kPadding),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Text(
              title,
              style: styleSubtitle,
            ),
          ],
        ),
      ),
    );
  }
}
