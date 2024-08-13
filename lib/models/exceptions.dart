part of devspace;




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

    return LibStrings.lib_exception_UnexpectedError.tr();
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
  String toUserFriendlyMessage(bool forEmployee) => forEmployee ? toString() : LibStrings.lib_exception_UnexpectedError.tr();
}






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