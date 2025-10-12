import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/deals_provider.dart';
import 'package:eisty/features/shared/presentation/widgets/widgets.dart';
import 'package:eisty/features/today/presentation/providers/filters_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterBottomSheet extends ConsumerWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const allowedCategories = [
      "Mexican",
      "Italian",
      // "Japanese",
      "Bar",
      "Desserts",
      "Pizza",
      "Tacos"
    ];
    final dayLabels = {
      "Monday": "L",
      "Tuesday": "Ma",
      "Wednesday": "Mi",
      "Thursday": "J",
      "Friday": "V",
      "Saturday": "S",
      "Sunday": "D",
    };
    final categories = [
      // Image.asset("assets/images/topmenu/$imageUrl.png", width: 35, height: 35,)
      {"label": "Postre", "icon": "assets/images/topmenu/ic_ice_cream.png"},
      {"label": "Comida", "icon": "assets/images/topmenu/ic_burger.png"},
      {"label": "Bar", "icon": "assets/images/topmenu/ic_soft_drink.png"},
      {"label": "Pizza", "icon": "assets/images/topmenu/ic_pizza.png"},
    ];
    final filters = ref.watch(filtersProvider);
    final notifier = ref.read(filtersProvider.notifier);
    final dealState = ref.watch(dealsProvider);

    final availableCategories = dealState.allDeals
        .expand(
          (deal) => deal.categories,
        )
        .where(
          (category) => allowedCategories.contains(category),
        )
        .toSet()
        .toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          // color: AppColors.amarillo1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //--Abierto ahora
          SwitchListTile(
            value: filters.openNow,
            onChanged: (value) => notifier.toggleOpenNow(),
            title: Text(
              'Abierto ahora',
              style: AppTextStyles.t1Bold.copyWith(
                  color: AppColors.blancoSazan,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
          ),
          Divider(
            color: AppColors.rosaPrimario,
            thickness: 3,
            indent: 30,
            endIndent: 30,
          ),

          //--Categories
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Text(
              'Categoría',
              style: AppTextStyles.t1Bold.copyWith(
                  color: AppColors.blancoSazan,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
          ),
          Wrap(
            spacing: 10,
            children: availableCategories.map(
              (category) {
                final selected = filters.categories.contains(category);

                return ChoiceChip(
                  label: Text(category),
                  selected: selected,
                  selectedColor: AppColors.rosaPrimario.withValues(alpha: 0.8),
                  onSelected: (value) => notifier.toggleCategory(category),
                );
              },
            ).toList(),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            children: categories.map((c) {
              final isSelected = filters.categories.contains(c['label']);
              return SazanIconChip(
                size: 12,
                label: c['label']!,
                iconPath: c['icon']!,
                selected: isSelected,
                onTap: () => notifier.toggleCategory(c['label']!),
              );
            }).toList(),
          ),

          const SizedBox(
            height: 20,
          ),
          Divider(
            color: AppColors.rosaPrimario,
            thickness: 3,
            indent: 30,
            endIndent: 30,
          ),

          //--Dias
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Text(
              'Promos por día de la semana',
              style: AppTextStyles.t1Bold.copyWith(
                  color: AppColors.blancoSazan,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: dayLabels.entries.map(
              (e) {
                final dayEng = e.key;
                final dayLabel = e.value;
                final selected = filters.days.contains(dayEng);

                return ChoiceChip(
                  label: Text(dayLabel),
                  selected: selected,
                  selectedColor: AppColors.rosaPrimario.withValues(alpha: 0.8),
                  onSelected: (value) => notifier.toggleDay(dayEng),
                );
              },
            ).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: AppColors.rosaPrimario,
            thickness: 3,
            indent: 30,
            endIndent: 30,
          ),

          //--Dias
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Text(
              'Distancia (radio)',
              style: AppTextStyles.t1Bold.copyWith(
                  color: AppColors.blancoSazan,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
          ),

          Slider(
            value: filters.distanceKm,
            min: 1,
            max: 50,
            divisions: 29,
            label: "${filters.distanceKm.toStringAsFixed(0)} km",
            onChanged: (value) => notifier.setDistance(value),
          ),
          Text(
            "${filters.distanceKm.toStringAsFixed(0)} km",
            style: AppTextStyles.t1Regular.copyWith(
                color: AppColors.blancoSazan,
                decoration: TextDecoration.underline,
                fontSize: 23),
          ),

          const SizedBox(
            height: 20,
          ),
          Divider(
            color: AppColors.rosaPrimario,
            thickness: 3,
            indent: 30,
            endIndent: 30,
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(spacing: 10, children: [
            FilterChip(
              label: Text("+18"),
              selected: filters.adultsOnly,
              onSelected: (value) => notifier.toggleAdultsOnly(),
              selectedColor: AppColors.rosaPrimario.withValues(alpha: 0.8),
            ),
            FilterChip(
              label: Text("Pet Friendly"),
              selected: filters.petFriendly,
              onSelected: (value) => notifier.togglePetFriendly(),
              selectedColor: AppColors.rosaPrimario.withValues(alpha: 0.8),
            ),
            FilterChip(
              label: Text("Delivery"),
              selected: filters.delivery,
              onSelected: (value) => notifier.toggleDelivery(),
              selectedColor: AppColors.rosaPrimario.withValues(alpha: 0.8),
            ),
            FilterChip(
              label: Text("Popular"),
              selected: filters.popular,
              onSelected: (value) => notifier.togglePopular(),
              selectedColor: AppColors.rosaPrimario.withValues(alpha: 0.8),
            ),
            FilterChip(
              label: Text("Featured"),
              selected: filters.featured,
              onSelected: (value) => notifier.toggleFeatured(),
              selectedColor: AppColors.rosaPrimario.withValues(alpha: 0.8),
            ),
            FilterChip(
              label: Text("Upcoming"),
              selected: filters.upcoming,
              onSelected: (value) => notifier.toggleUpcoming(),
              selectedColor: AppColors.rosaPrimario.withValues(alpha: 0.8),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blancoSazan,
                  foregroundColor: AppColors.blancoSazan,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                ref.read(dealsProvider.notifier).applyFilters({
                  'categories': ref.read(filtersProvider).categories,
                  'days':ref.read(filtersProvider).days,
                  'openNow': ref.read(filtersProvider).openNow,
                  'validToday': ref.read(filtersProvider).validToday,
                  'popular': ref.read(filtersProvider).popular,
                  'featured': ref.read(filtersProvider).featured,
                  'upcoming': ref.read(filtersProvider).upcoming,
                  'adultsOnly': ref.read(filtersProvider).adultsOnly,
                  'petFriendly': ref.read(filtersProvider).petFriendly,
                  'delivery': ref.read(filtersProvider).delivery,
                });
                Navigator.pop(context);
              },
              child: Text('Aplicar',
                  style: TextStyle(color: AppColors.casiNegro))),

          TextButton(
              onPressed: () {
                ref.read(dealsProvider.notifier).clearFilters();
                notifier.reset();
                Navigator.pop(context);
              },
              child: Text('Restaurar filtros',
                  style: AppTextStyles.t1Bold.copyWith(
                    color: AppColors.blancoSazan,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  )))
        ],
      ),
    );
  }
}
