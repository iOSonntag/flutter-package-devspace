

part of devspace;



class PageFetchResult<T> {

  final List<T> items;
  final String? nextCursor;

  const PageFetchResult({
    required this.items,
    this.nextCursor
  });

  factory PageFetchResult.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) itemFromJson)
  {
    return PageFetchResult<T>(
      items: (json.getOrThrow('items') as List).map((v) => itemFromJson(v)).toList(),
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