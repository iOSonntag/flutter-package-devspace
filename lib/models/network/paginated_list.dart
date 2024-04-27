

part of devspace;



class PageFetchResult<T> {

  final List<T> items;
  final String? nextCursor;

  const PageFetchResult({
    required this.items,
    this.nextCursor
  });

  factory PageFetchResult.fromJson(Map<String, dynamic> json, T? Function(Map<String, dynamic>) itemFromJson)
  {
    final listJsons = List<Map<String, dynamic>>.from(json.getOrThrow('items'));
    final List<T> items = [];

    for (final itemJson in listJsons)
    {
      T? item = itemFromJson(itemJson);

      if (item != null)
      {
        items.add(item);
      }
    }


    return PageFetchResult<T>(
      items: items,
      nextCursor: json.getOrNull('cursor') ?? json.getOrNull('nextCursor')
    );
  }

  Map<String, dynamic> toJson()
  {
    return {
      'items': items.map((v) => (v as dynamic).toJson()).toList(),
      if (nextCursor != null) 'cursor': nextCursor,
    };
  }

}