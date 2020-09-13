extension DecimalPart on num {
  num get decimalPart {
    return this - toInt();
  }
}
