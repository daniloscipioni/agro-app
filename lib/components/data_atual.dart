import 'package:intl/intl.dart';

String dataAtual(int milisegundos) {
  var date = DateTime.fromMillisecondsSinceEpoch(milisegundos);
  var dateNow = DateFormat("dd/MM/yyyy HH:mm").format(date);
  return dateNow;
}
