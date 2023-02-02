
import 'package:dailyAffirmationss/core/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int errorCode;
  final String message;

  const Failure(this.errorCode, this.message);

  @override
  List<Object?> get props => [errorCode, message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorCode, super.message);
}

class ClientFailure extends Failure {
  const ClientFailure(super.errorCode, super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.errorCode, super.message);
}

class FormatFailure extends Failure {
  const FormatFailure(super.errorCode, super.message);
}

class SocketFailure extends Failure {
  const SocketFailure(super.errorCode, super.message);
}

extension FailureExtension on Failure? {
  bool isShowRefreshButton() {
    if (this == null) return true;

    if (this!.errorCode.inRange(400, 499)) {
      return false;
    }
    return true;
  }
}
