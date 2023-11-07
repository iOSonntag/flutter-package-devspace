

part of devspace;



class PageFetchResult<T> {

  final List<T> items;
  final String? nextCursor;

  const PageFetchResult({
    required this.items,
    this.nextCursor
  });

}