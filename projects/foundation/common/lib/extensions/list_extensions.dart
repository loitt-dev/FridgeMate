/// List extensions for FridgeMate
extension ListExtensions<T> on List<T> {
  /// Get unique elements (remove duplicates)
  List<T> get unique => toSet().toList();

  /// Get first element or null if empty
  T? get firstOrNull => isEmpty ? null : first;

  /// Get last element or null if empty
  T? get lastOrNull => isEmpty ? null : last;

  /// Get second element or null if not exists
  T? get secondOrNull => length < 2 ? null : this[1];

  /// Get third element or null if not exists
  T? get thirdOrNull => length < 3 ? null : this[2];

  /// Get element at index or null if out of bounds
  T? elementAtOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Get element at index or default value if out of bounds
  T elementAtOrDefault(int index, T defaultValue) {
    if (index < 0 || index >= length) return defaultValue;
    return this[index];
  }

  /// Filter out null elements
  List<T> whereNotNull() =>
      where((element) => element != null).cast<T>().toList();

  /// Add item if not null
  void addIfNotNull(T? item) {
    if (item != null) add(item);
  }

  /// Add all items if not null
  void addAllIfNotNull(Iterable<T?> items) {
    addAll(items.where((item) => item != null).cast<T>());
  }

  /// Add item if condition is true
  void addIf(bool condition, T item) {
    if (condition) add(item);
  }

  /// Add all items if condition is true
  void addAllIf(bool condition, Iterable<T> items) {
    if (condition) addAll(items);
  }

  /// Remove item if condition is true
  void removeIf(bool Function(T) condition) {
    removeWhere(condition);
  }

  /// Keep only items that satisfy condition
  void keepIf(bool Function(T) condition) {
    removeWhere((item) => !condition(item));
  }

  /// Get random element
  T? get random {
    if (isEmpty) return null;
    return this[(DateTime.now().millisecondsSinceEpoch % length)];
  }

  /// Get random elements
  List<T> randomElements(int count) {
    if (isEmpty || count <= 0) return [];

    final shuffled = List<T>.from(this)..shuffle();
    return shuffled.take(count).toList();
  }

  /// Shuffle list and return new list
  List<T> get shuffled => List<T>.from(this)..shuffle();

  /// Split list into chunks of specified size
  List<List<T>> chunk(int size) {
    if (size <= 0) throw ArgumentError('Chunk size must be positive');

    final chunks = <List<T>>[];
    for (int i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }

  /// Get all combinations of specified size
  List<List<T>> combinations(int size) {
    if (size <= 0 || size > length) return [];
    if (size == length) return [List<T>.from(this)];
    if (size == 1) return map((item) => [item]).toList();

    final combinations = <List<T>>[];
    _generateCombinations(this, size, 0, <T>[], combinations);
    return combinations;
  }

  void _generateCombinations(
    List<T> items,
    int size,
    int start,
    List<T> current,
    List<List<T>> result,
  ) {
    if (current.length == size) {
      result.add(List<T>.from(current));
      return;
    }

    for (int i = start; i < items.length; i++) {
      current.add(items[i]);
      _generateCombinations(items, size, i + 1, current, result);
      current.removeLast();
    }
  }

  /// Get all permutations
  List<List<T>> get permutations {
    if (length <= 1) return [List<T>.from(this)];

    final permutations = <List<T>>[];
    _generatePermutations(List<T>.from(this), 0, permutations);
    return permutations;
  }

  void _generatePermutations(List<T> items, int start, List<List<T>> result) {
    if (start == items.length - 1) {
      result.add(List<T>.from(items));
      return;
    }

    for (int i = start; i < items.length; i++) {
      _swap(items, start, i);
      _generatePermutations(items, start + 1, result);
      _swap(items, start, i);
    }
  }

  void _swap(List<T> items, int i, int j) {
    final temp = items[i];
    items[i] = items[j];
    items[j] = temp;
  }

  /// Group elements by key
  Map<K, List<T>> groupBy<K>(K Function(T) keySelector) {
    final groups = <K, List<T>>{};
    for (final item in this) {
      final key = keySelector(item);
      groups.putIfAbsent(key, () => <T>[]).add(item);
    }
    return groups;
  }

  /// Group elements by key and transform values
  Map<K, List<V>> groupByAndTransform<K, V>(
    K Function(T) keySelector,
    V Function(T) valueSelector,
  ) {
    final groups = <K, List<V>>{};
    for (final item in this) {
      final key = keySelector(item);
      final value = valueSelector(item);
      groups.putIfAbsent(key, () => <V>[]).add(value);
    }
    return groups;
  }

  /// Partition list into two lists based on condition
  (List<T>, List<T>) partition(bool Function(T) condition) {
    final trueList = <T>[];
    final falseList = <T>[];

    for (final item in this) {
      if (condition(item)) {
        trueList.add(item);
      } else {
        falseList.add(item);
      }
    }

    return (trueList, falseList);
  }

  /// Get distinct elements by key
  List<T> distinctBy<K>(K Function(T) keySelector) {
    final seen = <K>{};
    return where((item) => seen.add(keySelector(item))).toList();
  }

  /// Sort by key
  List<T> sortedBy<K extends Comparable<K>>(K Function(T) keySelector) {
    final sorted = List<T>.from(this);
    sorted.sort((a, b) => keySelector(a).compareTo(keySelector(b)));
    return sorted;
  }

  /// Sort by key in descending order
  List<T> sortedByDescending<K extends Comparable<K>>(
    K Function(T) keySelector,
  ) {
    final sorted = List<T>.from(this);
    sorted.sort((a, b) => keySelector(b).compareTo(keySelector(a)));
    return sorted;
  }

  /// Take elements while condition is true
  List<T> takeWhile(bool Function(T) condition) {
    final result = <T>[];
    for (final item in this) {
      if (condition(item)) {
        result.add(item);
      } else {
        break;
      }
    }
    return result;
  }

  /// Drop elements while condition is true
  List<T> dropWhile(bool Function(T) condition) {
    final result = <T>[];
    bool dropping = true;

    for (final item in this) {
      if (dropping && condition(item)) {
        continue;
      }
      dropping = false;
      result.add(item);
    }
    return result;
  }

  /// Get elements at even indices
  List<T> get evenIndices {
    final result = <T>[];
    for (int i = 0; i < length; i += 2) {
      result.add(this[i]);
    }
    return result;
  }

  /// Get elements at odd indices
  List<T> get oddIndices {
    final result = <T>[];
    for (int i = 1; i < length; i += 2) {
      result.add(this[i]);
    }
    return result;
  }

  /// Get elements with their indices
  List<(int, T)> get withIndices {
    return asMap().entries.map((entry) => (entry.key, entry.value)).toList();
  }

  /// Get elements with their indices as pairs
  List<MapEntry<int, T>> get withIndicesAsEntries {
    return asMap().entries.toList();
  }

  /// Check if all elements satisfy condition
  bool all(bool Function(T) condition) {
    return every(condition);
  }

  /// Check if any element satisfies condition
  bool any(bool Function(T) condition) {
    return any(condition);
  }

  /// Check if none of elements satisfy condition
  bool none(bool Function(T) condition) {
    return !any(condition);
  }

  /// Get count of elements satisfying condition
  int count(bool Function(T) condition) {
    return where(condition).length;
  }

  /// Get sum of numeric values
  num sum(num Function(T) selector) {
    return fold(0, (sum, item) => sum + selector(item));
  }

  /// Get average of numeric values
  double average(num Function(T) selector) {
    if (isEmpty) return 0;
    return sum(selector) / length;
  }

  /// Get minimum element by key
  T? minBy<K extends Comparable<K>>(K Function(T) keySelector) {
    if (isEmpty) return null;
    return reduce(
      (a, b) => keySelector(a).compareTo(keySelector(b)) <= 0 ? a : b,
    );
  }

  /// Get maximum element by key
  T? maxBy<K extends Comparable<K>>(K Function(T) keySelector) {
    if (isEmpty) return null;
    return reduce(
      (a, b) => keySelector(a).compareTo(keySelector(b)) >= 0 ? a : b,
    );
  }

  /// Get minimum key value
  K? minKey<K extends Comparable<K>>(K Function(T) keySelector) {
    if (isEmpty) return null;
    return map(keySelector).reduce((a, b) => a.compareTo(b) <= 0 ? a : b);
  }

  /// Get maximum key value
  K? maxKey<K extends Comparable<K>>(K Function(T) keySelector) {
    if (isEmpty) return null;
    return map(keySelector).reduce((a, b) => a.compareTo(b) >= 0 ? a : b);
  }

  /// Insert element at index safely
  void insertSafe(int index, T element) {
    if (index < 0) {
      insert(0, element);
    } else if (index >= length) {
      add(element);
    } else {
      insert(index, element);
    }
  }

  /// Remove element at index safely
  T? removeAtSafe(int index) {
    if (index < 0 || index >= length) return null;
    return removeAt(index);
  }

  /// Swap elements at indices
  void swap(int index1, int index2) {
    if (index1 < 0 || index1 >= length || index2 < 0 || index2 >= length) {
      throw RangeError('Index out of range');
    }
    final temp = this[index1];
    this[index1] = this[index2];
    this[index2] = temp;
  }

  /// Reverse list in place and return self
  List<T> get reversedInPlace {
    List<T> reversed = List<T>.from(this);
    reversed = reversed.reversed.toList();
    clear();
    addAll(reversed);
    return this;
  }

  /// Get list without first n elements
  List<T> drop(int count) {
    if (count <= 0) return List<T>.from(this);
    if (count >= length) return <T>[];
    return sublist(count);
  }

  /// Get list without last n elements
  List<T> dropLast(int count) {
    if (count <= 0) return List<T>.from(this);
    if (count >= length) return <T>[];
    return sublist(0, length - count);
  }

  /// Get list with only first n elements
  List<T> take(int count) {
    if (count <= 0) return <T>[];
    if (count >= length) return List<T>.from(this);
    return sublist(0, count);
  }

  /// Get list with only last n elements
  List<T> takeLast(int count) {
    if (count <= 0) return <T>[];
    if (count >= length) return List<T>.from(this);
    return sublist(length - count);
  }
}
