part of devspace;


// TODO: introduce toUserMessage() method to all exceptions and then use that in
// the ui to display nice error messages to the user


abstract interface class UserFriendlyException
{
  String toUserFriendlyMessage();
} 

abstract class ExceptionTool {

  ExceptionTool._();

  static toUserFriendlyMessage(Object exception)
  {
    if (exception is UserFriendlyException)
    {
      return exception.toUserFriendlyMessage();
    }

    // TODO: localize
    return 'An unexpected error occurred';
  }

}


class UnexpectedError extends Error implements UserFriendlyException
{
  final String message;

  UnexpectedError([this.message = 'An unexpected error occurred']);

  @override
  String toString()
  {
    return 'UnexpectedError: $message';
  }
  
  @override
  String toUserFriendlyMessage()
  {
    // TODO: localize
    return 'An unexpected error occurred.';
  }
}






// TODO: move to errors.dart

class LibraryIssueError extends Error
{
  final String message;

  LibraryIssueError(this.message);

  @override
  String toString()
  {
    return 'LibraryIssue: $message';
  }
}