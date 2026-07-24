import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure(this.message, {this.code});

  @override
  List<Object?> get props => [message, code];
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(super.message, {this.statusCode, super.code});

  @override
  List<Object?> get props => [message, statusCode, code];
}

class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = 'خطأ في الاتصال بالشبكة، يرجى التحقق من اتصالك بالإنترنت',
    super.code = 'NETWORK_ERROR',
  ]);
}

class CacheFailure extends Failure {
  const CacheFailure([
    super.message = 'خطأ في جلب البيانات المحفوظة محلياً',
    super.code = 'CACHE_ERROR',
  ]);
}
