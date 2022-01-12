import 'package:catatan_projek/app/themes/app_text_theme.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.pemasukan,
    required this.belumLunas,
    required this.lunas,
  }) : super(key: key);

  final String pemasukan;
  final String belumLunas;
  final String lunas;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: <Widget>[
              Text(
                'Pemasukan',
              ),
              Text(
                pemasukan,
                style: warningStyle,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text('Belum Lunas'),
              Text(
                belumLunas,
                style: dangerStyle,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text('Lunas'),
              Text(lunas),
            ],
          )
        ],
      ),
    );
  }
}
