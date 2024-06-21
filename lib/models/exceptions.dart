part of devspace;


// TODO: introduce toUserMessage() method to all exceptions and then use that in
// the ui to display nice error messages to the user


abstract interface class UserFriendlyException
{
  String toUserFriendlyMessage(bool forEmployee);
} 

abstract class ExceptionTool {

  ExceptionTool._();

  static toUserFriendlyMessage(Object exception)
  {
    if (App.config.errorShadowing == kErrorShadowing.developer)
    {
      return exception.toString();
    }

    if (exception is UserFriendlyException)
    {
      return exception.toUserFriendlyMessage(App.config.errorShadowing == kErrorShadowing.employee);
    }

    if (App.config.errorShadowing == kErrorShadowing.employee)
    {
      return exception.toString();
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
  
  // TODO: localize
  @override
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : 'An unexpected error occurred.';
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