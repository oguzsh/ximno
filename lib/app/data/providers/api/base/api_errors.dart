class ApiErrors implements Exception {
  late final String? message;
  late final String? prefix;
  late final String? url;

  ApiErrors([this.message, this.prefix, this.url]);
}

class BadRequestError extends ApiErrors {
  BadRequestError([String? message, String? url])
      : super(message, 'Bad Request', url);
}

class FetchDataError extends ApiErrors {
  FetchDataError([String? message, String? url])
      : super(message, 'Unable to process', url);
}

class ServerError extends ApiErrors {
  ServerError([String? message, String? url])
      : super(message, 'Internal Server Error', url);
}

class ApiNotRespondingError extends ApiErrors {
  ApiNotRespondingError([String? message, String? url])
      : super(message, 'API not responding', url);
}

class UnauthorizedError extends ApiErrors {
  UnauthorizedError([String? message, String? url])
      : super(message, 'Unauthorized Request', url);
}

class ConflictError extends ApiErrors {
  ConflictError([String? message, String? url])
      : super(message, 'Resource already exists.', url);
}

class NotFoundError extends ApiErrors {
  NotFoundError([String? message, String? url])
      : super(message, 'Not found', url);
}
