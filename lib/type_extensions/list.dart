




part of devspace;


extension NullableListExtension<E> on List<E>? {

  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;

}

extension ListExtension<E> on List<E> {

  Map<T, E> toMap<T>(T Function(E e) f)
  {
    Map<T, E> map = {};
    forEach((e) => map[f(e)] = e);
    return map;
  }

  List<T> mapToList<T>(T Function(E e, int i) f)
  {
    return mapIndexed<T>(f).toList();
  }

  Iterable<T> mapIndexed<T>(T Function(E e, int i) f)
  {
    var i = 0;
    return map<T>((e) => f(e, i++));
  }

  void forEachIndexed(void Function(E e, int i) f)
  {
    var i = 0;
    forEach((e) => f(e, i++));
  }

  /// Returns a copy of this list.
  /// 
  /// If [alsoCopyChildLists] is true, then any child lists
  /// will also be copied.
  List<E> copy({bool alsoCopyChildLists = false})
  {
    if (alsoCopyChildLists && E is List)
    {
      return map((element) => List.from(element as Iterable)).toList() as List<E>;
    }

    return List.from(this);
  }


  bool hasIndex(int index)
  {
    return index >= 0 && index < length;
  }
}


extension ListExt on List<Widget> {

  col() => Column(children: this);

}



