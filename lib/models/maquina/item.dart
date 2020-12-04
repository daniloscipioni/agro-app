import 'package:bavaresco/database/machine_dao.dart';
import 'package:bavaresco/models/maquina/machine.dart';
import 'package:bavaresco/repository/machineRepository.dart';
import 'package:bavaresco/screens/lista/maquina.dart';
import 'package:flutter/material.dart';

// Informações de cadastro de máquina

// class ItemMaquinaPrimary extends StatelessWidget {
//   final InfoMaquinaPrimary _infoMaquinaPrimary;
//
//   ItemMaquinaPrimary(this._infoMaquinaPrimary);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       child: Column(
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 Card(
//                   color: Colors.white60,
//                   child: InfoMaquinaPrimary(
//                     tituloMaquina: _infoMaquinaPrimary.tituloMaquina,
//                     anoFabricacao: _infoMaquinaPrimary.anoFabricacao,
//                     numeroSerie: _infoMaquinaPrimary.numeroSerie,
//                     motor: _infoMaquinaPrimary.motor,
//                     potencia: _infoMaquinaPrimary.potencia,
//                     valor: _infoMaquinaPrimary.valor,
//                     tanque: _infoMaquinaPrimary.tanque,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }

// class InfoMaquinaPrimary extends StatelessWidget {
//   final String tituloMaquina;
//   final String anoFabricacao;
//   final String numeroSerie;
//   final String motor;
//   final String potencia;
//   final double valor;
//   final int tanque;
//
//   InfoMaquinaPrimary(
//       {this.tituloMaquina,
//       this.anoFabricacao,
//       this.numeroSerie,
//       this.motor,
//       this.potencia,
//       this.valor,
//       this.tanque});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: SizedBox(
//        // height: 120,
//        // width: 200,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
//                 child: _DescInfoMaquinaPrimary(
//                   tituloMaquina: tituloMaquina,
//                   anoFabricacao: anoFabricacao != null
//                       ? 'Ano Fabricação: $anoFabricacao'
//                       : null,
//                   numeroSerie: numeroSerie != null
//                       ? 'Número de Série:$numeroSerie'
//                       : null,
//                   motor: motor != null ? 'Motor:$motor' : null,
//                   potencia: potencia != null ? 'Potencia:$potencia' : null,
//                   valor: valor != null ? valor : null,
//                   tanque: tanque != null ? tanque : null,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _DescInfoMaquinaPrimary extends StatelessWidget {
//   final String tituloMaquina;
//   final String anoFabricacao;
//   final String numeroSerie;
//   final String motor;
//   final String potencia;
//   final double valor;
//   final int tanque;
//
//   _DescInfoMaquinaPrimary(
//       {this.tituloMaquina,
//       this.anoFabricacao,
//       this.numeroSerie,
//       this.motor,
//       this.potencia,
//       this.valor,
//       this.tanque});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 '$tituloMaquina',
//                 maxLines: 1,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             if (anoFabricacao != null)
//               Text(
//                 anoFabricacao,
//                 style: const TextStyle(
//                   fontSize: 12.0,
//                   color: Colors.black87,
//                 ),
//               ),
//             if (numeroSerie != null)
//               Text(
//                 numeroSerie,
//                 style: const TextStyle(
//                   fontSize: 12.0,
//                   color: Colors.black54,
//                 ),
//               ),
//             if (motor != null)
//               Text(
//                 motor,
//                 style: const TextStyle(
//                   fontSize: 12.0,
//                   color: Colors.black54,
//                 ),
//               ),
//             if (potencia != null)
//               Text(
//                 potencia,
//                 style: const TextStyle(
//                   fontSize: 12.0,
//                   color: Colors.black54,
//                 ),
//               ),
//             if (valor != null)
//               Text(
//                 '$valor',
//                 style: const TextStyle(
//                   fontSize: 12.0,
//                   color: Colors.black54,
//                 ),
//               ),
//             if (tanque != null)
//               Text(
//                 '$tanque',
//                 style: const TextStyle(
//                   fontSize: 12.0,
//                   color: Colors.black54,
//                 ),
//               ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// Informações de histório de máquina

// class ItemMaquina extends StatelessWidget {
//   final InfoMaquina _infoMaquina;
//
//   ItemMaquina(this._infoMaquina);
//
//   @override
//   Widget build(BuildContext context) {
//     //Torna o card clicável
//     return InkWell(
//       onTap: () {
//         print("Card Clicked");
//       },
//       child: Card(
//         child: InfoMaquina(
//           tituloMaquina: _infoMaquina.tituloMaquina,
//           horimetro: _infoMaquina.horimetro,
//           consumoMedio: _infoMaquina.consumoMedio,
//           custoHorario: _infoMaquina.custoHorario,
//           manutencaoPrev: _infoMaquina.manutencaoPrev,
//         ),
//       ),
//     );
//   }
// }

// class InfoMaquina extends StatelessWidget {
//   final String tituloMaquina;
//   final int fabricanteMaquina;
//   final int categoriaMaquina;
//   final String modeloMaquina;
//   final String horimetro;
//   final String consumoMedio;
//   final String custoHorario;
//   final String manutencaoPrev;
//
//   InfoMaquina(
//       {this.tituloMaquina,
//       this.fabricanteMaquina,
//       this.categoriaMaquina,
//       this.modeloMaquina,
//       this.horimetro,
//       this.consumoMedio,
//       this.custoHorario,
//       this.manutencaoPrev});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: SizedBox(
//         height: 80,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
//                 child: _DescInfoMaquina(
//                   fabricanteMaquina: fabricanteMaquina,
//                   tituloMaquina: tituloMaquina,
//                   horimetro: horimetro != null ? 'Horimetro: $horimetro' : null,
//                   consumoMedio: consumoMedio != null
//                       ? 'Consumo Médio:$consumoMedio'
//                       : null,
//                   custoHorario: custoHorario != null
//                       ? 'Custo Horário:$custoHorario'
//                       : null,
//                   manutencaoPrev: manutencaoPrev != null
//                       ? 'Manutenção Preventiva:$manutencaoPrev'
//                       : null,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//
class _DescInfoMaquina extends StatelessWidget {
  final String tituloMaquina;
  final int fabricanteMaquina;
  final String horimetro;
  final String consumoMedio;
  final String custoHorario;
  final String manutencaoPrev;

  _DescInfoMaquina(this.tituloMaquina, this.fabricanteMaquina, this.horimetro,
      this.consumoMedio, this.custoHorario, this.manutencaoPrev);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$tituloMaquina - $fabricanteMaquina',
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            if (horimetro != null)
              Text(
                horimetro,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
            if (consumoMedio != null)
              Text(
                consumoMedio,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            if (custoHorario != null)
              Text(
                custoHorario,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            if (manutencaoPrev != null)
              Text(
                manutencaoPrev,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

//Informações



