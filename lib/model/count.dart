class Count {
  final int value;

  Count(this.value);

  Count increment() {
    return Count(value + 1);
  }
}
