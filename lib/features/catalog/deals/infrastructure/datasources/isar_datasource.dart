import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/infrastructure/infrastructure.dart';
import 'package:eisty/features/catalog/deals/infrastructure/mappers/deal_mapper.dart';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([DealEntitySchema],
          directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isDealFavorite(String dealId) async {
    final isar = await db;
    final isDealFavorite =
        await isar.dealEntitys.filter().idEqualTo(dealId).findFirst();

    return isDealFavorite != null;
  }

  @override
  Future<List<Deal>> loadDeals({int limit = 10, offset = 0}) async {
    final isar = await db;

    final entities =
        await isar.dealEntitys.where().offset(offset).limit(limit).findAll();

    return entities
        .map(
          (e) => e.toEntity(),
        )
        .toList();
  }

  @override
  Future<void> toogleFavorite(Deal deal) async {
    final isar = await db;

    final existing =
        await isar.dealEntitys.filter().idEqualTo(deal.id).findFirst();

    if (existing != null) {
      await isar.writeTxn(
        () async {
          await isar.dealEntitys.delete(existing.isarId);
        },
      );
    } else {
      final entity = deal.toIsar();
      await isar.writeTxn(
        () async {
          await isar.dealEntitys.put(entity);
        },
      );
    }
  }
}
