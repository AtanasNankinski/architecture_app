import 'package:equatable/equatable.dart';

part 'error_strings.dart';

class AppError extends Equatable {
  final String title;
  final String description;

  const AppError(this.title, this.description);

  @override
  List<Object?> get props => [title, description];

  factory AppError.fromException(Object error) {
    final exception = AppException.generate(error);

    return AppError(
      exception.getTitle(exception as ExceptionDataMixin) ?? "",
      exception.getDescription(exception as ExceptionDataMixin) ?? "",
    );
  }
}

class AppException implements Exception {
  AppException();

  static AppException generate(dynamic error) {
    if(error is AppException) {
      return error;
    }

    return DefaultException();
  }

  String? getTitle(ExceptionDataMixin exceptionData) {
    return exceptionData.title();
  }

  String? getDescription(ExceptionDataMixin exceptionData) {
    return exceptionData.description();
  }
}

mixin ExceptionDataMixin {
  String? title();

  String? description();
}

final class DefaultException extends AppException with ExceptionDataMixin {
  DefaultException();

  @override
  String? title() => ErrorStrings.defaultErrorTitle;

  @override
  String? description() => ErrorStrings.defaultErrorDesc;

  @override
  String toString() {
    return ErrorStrings.testErrorTitle;
  }
}
