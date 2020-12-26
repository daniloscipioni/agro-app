import 'package:intl/intl.dart';

final formatNumber = new NumberFormat("#,##0", "pt_BR");
final formatNumberDouble = new NumberFormat("#,##0.00", "pt_BR");

String patterNumber(int value){
return formatNumber.format(value);
}

String patterNumberDouble(double value){
  return formatNumberDouble.format(value);
}