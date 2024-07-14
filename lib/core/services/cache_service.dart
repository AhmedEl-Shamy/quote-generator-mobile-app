import 'package:hive_flutter/adapters.dart';

abstract class CacheService {
  Future<void> write(String quoteId);
  Future<void> delete(String quoteId);
  List<String> readAll();
}

class CacheServiceImpl extends CacheService {
  static const quotesBoxName = 'quotes';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(quotesBoxName);
  }
  
  @override
  List<String> readAll() {
    Box<String> box = Hive.box<String>(quotesBoxName);
    List<String> data = box.values.toList();
    return data;
  }
  
  @override
  Future<void> write(String quoteId) async {
    Box<String> box = Hive.box<String>(quotesBoxName);
    await box.put(quoteId, quoteId);
  }
  
  @override
  Future<void> delete(String quoteId) async {
    Box<String> box = Hive.box(quotesBoxName);
    box.delete(quoteId);
  }
}