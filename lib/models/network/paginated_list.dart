

part of devspace;



class PageFetchResult<T> {

  final List<T> items;
  final String? nextCursor;

  const PageFetchResult({
    required this.items,
    this.nextCursor
  });

  factory PageFetchResult.empty()
  {
    return PageFetchResult<T>(items: [], nextCursor: null);
  }

  factory PageFetchResult.fromJson(Map<String, dynamic> json, T? Function(Map<String, dynamic>) itemFromJson)
  {
    final listJsons = List<Map<String, dynamic>>.from(json.getOrThrow('items'));
    final List<T> items = [];

    for (final itemJson in listJsons)
    {
      try
      {
        T? item = itemFromJson(itemJson);

        if (item != null)
        {
          items.add(item);
        }
      }
      catch (e)
      {
        Dev.logError('PageFetchResult', 'Failed to parse item from json', e);
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