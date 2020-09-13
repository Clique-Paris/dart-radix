extension DecimalPart on num {
  double get decimalPart {
    return this - toInt();
  }
}
