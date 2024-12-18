extension MapKeyComparator on Map<String, dynamic> {
  void keysAreTheSameOrThrow(
    Map<String, dynamic> other, {
      required String thisLabel,
      required String otherLabel,
      String prefix = '',
    }) {
      for (final entry in entries) {
        final thisKey = entry.key;
        final prefixedKey = prefix.isEmpty ? thisKey : '$prefix > $thisKey';

        if (!other.containsKey(thisKey)) {
          throw Exception('Key $prefixedKey found in $thisLabel but not in $otherLabel');
        }

        if (entry.value is String) {
          if (other[thisKey] is! String) {
            throw Exception('Key $prefixedKey is a String in $thisLabel but ${other[thisKey].runtimeType} in $otherLabel');
          }
        } else {
          final inner = this[thisKey] as Map<String, dynamic>;
          final otherInner = other[thisKey] as Map<String, dynamic>;
          inner.keysAreTheSameOrThrow(
            otherInner, 
            thisLabel: thisLabel, 
            otherLabel: otherLabel,
            prefix: prefixedKey
          );
        }
      }  
    }
  

}