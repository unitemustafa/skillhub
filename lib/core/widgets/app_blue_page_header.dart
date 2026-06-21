import 'package:flutter/material.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_back_button.dart';
import 'package:skillhub/core/widgets/app_blue_header_background.dart';

class AppBluePageHeader extends StatelessWidget {
  const AppBluePageHeader({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.bottomHeight = 0,
    this.showBackButton = true,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? bottom;
  final double bottomHeight;
  final bool showBackButton;
  final bool pinned;
  final bool floating;
  final bool snap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      floating: floating,
      snap: snap && floating,
      toolbarHeight: 66,
      backgroundColor: AppColors.accentBlueDark,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: const AppBlueHeaderBackground(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
        child: SizedBox.expand(),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading:
          leading ??
          (showBackButton ? const AppBackButton(color: AppColors.white) : null),
      actions: actions,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: bottom == null
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(bottomHeight),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: bottom,
              ),
            ),
    );
  }
}
