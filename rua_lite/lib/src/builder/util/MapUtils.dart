abstract class MapUtils {
  static Map<String, Object> flatten(
    Map map,
  ) {
    Map<String, Object> flatMap = {};
    map.forEach((key, value) {
      List<MapEntry<String, Object>> entries = _flatten(key, value, []);
      flatMap.addEntries(entries);
    });
    return flatMap;
  }

  static List<MapEntry<String, Object>> _flatten(
    String key,
    Object val,
    List<MapEntry<String, Object>> list,
  ) {
    if (val is List) {
      for (int i = 0; i < val.length; i++) {
        _flatten("$key.$i", val[i], list);
      }
    } else if (val is Map) {
      val.forEach((k, v) {
        _flatten("$key.$k", v, list);
      });
    } else {
      list.add(MapEntry(key, val));
    }
    return list;
  }
}
