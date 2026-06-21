import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_back_button.dart';
import 'package:skillhub/core/widgets/app_blue_header_background.dart';

class PlayersAppBar extends StatelessWidget {
  const PlayersAppBar({
    super.key,
    required this.selectedBirthYear,
    required this.availableBirthYears,
    required this.onBirthYearChanged,
    required this.searchController,
    required this.searchQuery,
    required this.onSearchChanged,
    this.showBackButton = true,
  });

  final int? selectedBirthYear;
  final List<int> availableBirthYears;
  final ValueChanged<int?> onBirthYearChanged;
  final TextEditingController searchController;
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
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
      leading: showBackButton
          ? const AppBackButton(color: AppColors.white)
          : null,
      title: const Text(
        'اللاعبين',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(116),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: searchController,
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'دور على لاعب...',
                  fillColor: AppColors.white,
                  prefixIcon: const Icon(
                    Iconsax.search_normal,
                    color: AppColors.mutedText,
                  ),
                  suffixIcon: searchQuery.trim().isEmpty
                      ? null
                      : IconButton(
                          tooltip: 'مسح البحث',
                          onPressed: () {
                            searchController.clear();
                            onSearchChanged('');
                          },
                          icon: const Icon(
                            Iconsax.close_circle,
                            color: AppColors.mutedText,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _BirthYearChip(
                        label: 'كل السنين',
                        selected: selectedBirthYear == null,
                        onSelected: () => onBirthYearChanged(null),
                      ),
                      for (final year in availableBirthYears)
                        _BirthYearChip(
                          label: '$year',
                          selected: selectedBirthYear == year,
                          onSelected: () => onBirthYearChanged(year),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BirthYearChip extends StatelessWidget {
  const _BirthYearChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        showCheckmark: false,
        side: BorderSide(
          color: selected ? AppColors.accentBlueDark : AppColors.white,
          width: selected ? 1.4 : 1,
        ),
        backgroundColor: AppColors.white,
        selectedColor: AppColors.white,
        shadowColor: AppColors.navy.withValues(alpha: 0.14),
        elevation: selected ? 3 : 0,
        labelStyle: TextStyle(
          color: AppColors.accentBlueDark,
          fontWeight: FontWeight.w800,
        ),
        onSelected: (_) => onSelected(),
      ),
    );
  }
}
