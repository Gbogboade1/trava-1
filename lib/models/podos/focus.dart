class FocusState {
  bool hasText;
  bool isFocused;
  bool hasError;

  FocusState({this.hasText = false, this.isFocused = false, this.hasError = false,});

  @override
  bool operator ==(other) {
    return (other is FocusState) && (other.isFocused == isFocused && other.hasText == hasText && other.hasError == hasError);
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;





}