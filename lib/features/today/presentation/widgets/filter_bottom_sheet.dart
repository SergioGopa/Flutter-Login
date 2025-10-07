import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/deals_provider.dart';
import 'package:eisty/features/today/presentation/providers/filters_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterBottomSheet extends ConsumerWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    final notifier = ref.read(filtersProvider.notifier);

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
            children: ["Postre", "Comida", "Bar", "Mexican", "Italian"].map(
              (e) {
                final selected = filters.categories.contains(e);

                return ChoiceChip(
                  label: Text(e),
                  selected: selected,
                  onSelected: (value) => notifier.toggleCategory(e),
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
              'Promos por día de la semana',
              style: AppTextStyles.t1Bold.copyWith(
                  color: AppColors.blancoSazan,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
          ),
          Wrap(
            spacing: 10,
            children: ["L", "Ma", "Mi", "J", "V", "S", "D"].map(
              (e) {
                final selected = filters.categories.contains(e);

                return ChoiceChip(
                  label: Text(e),
                  selected: selected,
                  onSelected: (value) => notifier.toggleCategory(e),
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
            ),
            FilterChip(
              label: Text("Pet Friendly"),
              selected: filters.petFriendly,
              onSelected: (value) => notifier.togglePetFriendly(),
            ),
            FilterChip(
              label: Text("Delivery"),
              selected: filters.delivery,
              onSelected: (value) => notifier.toggleDelivery(),
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
                  'validToday': ref.read(filtersProvider).validToday,
                  'popular': ref.read(filtersProvider).popular,
                  'featured': ref.read(filtersProvider).featured,
                  'upcoming': ref.read(filtersProvider).upcoming,

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
