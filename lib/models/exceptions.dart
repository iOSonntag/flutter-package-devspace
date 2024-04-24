part of devspace;


class LibraryIssue implements Exception
{
  final String message;

  LibraryIssue(this.message);

  @override
  String toString()
  {
    return 'LibraryIssue: $message';
  }
}