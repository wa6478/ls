function later(func, arg) {
  return function() {
    return func(arg);
  }
}