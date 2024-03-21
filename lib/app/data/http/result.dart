sealed class Result<S, int> {
  const Result();
}

final class Success<S, int> extends Result<S, int> {
  const Success(this.value);
  final S value;
}

final class Failure<S, int> extends Result<S, int> {
  const Failure(this.exception);
  final int exception;
}
