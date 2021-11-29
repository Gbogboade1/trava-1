Stream<int> countDown({int seconds = 300}) async* {
  int i = seconds;
  while (i >= 0) {
    await Future.delayed(Duration(seconds: 1));
    yield i--;
  }
}