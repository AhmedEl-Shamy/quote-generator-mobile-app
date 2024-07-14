import 'package:hive_flutter/adapters.dart';

abstract class CacheService {
  Future<void> write(String data);
  Future<List<String>> readAll();
}

class CacheServiceImpl extends CacheService {
  static const quotesBoxName = 'quotes';

  static void initHive() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(quotesBoxName);
  }
  
  @override
  Future<List<String>> readAll() async {
    Box<String> box = Hive.box<String>(quotesBoxName);
    List<String> data = box.values.toList();
    return data;
  }
  
  @override
  Future<void> write(String data) async {
    Box<String> box = Hive.box<String>(quotesBoxName);
    await box.add(data);
  }
}