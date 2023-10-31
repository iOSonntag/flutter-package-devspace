


part of devspace;


extension AResultExtensionOnEnum on Enum
{
  String get name => toString().split('.').last;

  bool get isErrorValue => name.startsWith('error');
  bool get isSuccess => name == 'success';

  bool get isUnknownError => name == 'errorUnknown';

  bool get isPartialSuccess => name.startsWith('successBut');
}

// ignore: camel_case_types
enum kAResultBasic
{
  success,
  error,
}

typedef AResultBasic = AResult<kAResultBasic>;
typedef AResultBasicData<T> = AResultData<kAResultBasic, T>;

class AResult<T extends Enum> extends AResultBase
{
  final T result;

  AResult(this.result);

  @override
  bool get isSuccess => result.isSuccess;

  @override
  bool get isError => result.isErrorValue;

  @override
  bool get isUnknownError => result.isUnknownError;
  
}

class AResultPartialSuccess<T extends Enum> extends AResult<T> with AResultPartialSuccessMixin
{
  AResultPartialSuccess(T result) : super(result);
}

class AResultData<T extends Enum, D> extends AResult<T>
{
  final D data;

  AResultData(T result, this.data) : super(result);
}

class AResultDataPartialSuccess<T extends Enum, D> extends AResultData<T, D> with AResultPartialSuccessMixin
{
  AResultDataPartialSuccess(T result, D data) : super(result, data);
}


abstract class AResultBase {

  /// Returns true if the action was successful.
  bool get isSuccess;


  /// Returns true if the action failed.
  /// 
  /// Note: If the action implements the [PartialSuccess] mixin,
  /// use should check the [isPartialSuccess] prior to checking errors as it
  /// might return true even if [isError] is true.
  bool get isError;

  /// Returns true if the action failed because of an unknown error.
  bool get isUnknownError;


  final Set<String> _flags;

  bool hasFlag(String flag) => _flags.contains(flag);

  const AResultBase({
    Set<String> flags = const <String>{}
  }) : _flags = flags;

}

mixin AResultPartialSuccessMixin<T extends Enum> on AResult<T> {

  /// Returns true if the action was partially successful.
  /// 
  /// This is used for actions that can be partially successful, e.g. when
  /// signing in and the credentials are correct but the user needs to change
  /// the initial password.
  /// 
  /// Note: If the action can fail, use [isError] prior to checking this
  bool get isPartialSuccess => result.isPartialSuccess;

}


mixin AResultPartialSuccessBaseMixin {

  /// Returns true if the action was partially successful.
  /// 
  /// This is used for actions that can be partially successful, e.g. when
  /// signing in and the credentials are correct but the user needs to change
  /// the initial password.
  /// 
  /// Note: If the action can fail, use [isError] prior to checking this
  bool get isPartialSuccess;

}



