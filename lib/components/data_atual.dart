import 'package:intl/intl.dart';

String dataAtual(int milisegundos){
  // var dateValue = new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(DateTime.now().toIso8601String());
  // dateValue.add(Duration(hours: -3));
  // String dateNow = DateFormat("dd/MM/yyyy hh:mm").format(dateValue);

   var date = DateTime.fromMillisecondsSinceEpoch(milisegundos);

   var dateNow = DateFormat("dd/MM/yyyy HH:mm").format(date);

  return dateNow;
}
