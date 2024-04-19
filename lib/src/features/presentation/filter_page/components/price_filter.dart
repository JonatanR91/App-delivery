import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';

class PrinceFilter extends StatefulWidget {
  const PrinceFilter({super.key});

  @override
  State<PrinceFilter> createState() => _PrinceFilterState();
}

class _PrinceFilterState extends State<PrinceFilter> {
  RangeValues _values = const RangeValues(0.3, 1.0);
  int _minPrice = 0;
  int _maxprice = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('$_minPrice ',
        style: const TextStyle(fontSize: 16)
        ),
        SizedBox(
          width: 300,
          child: RangeSlider(
            activeColor: orange,
            inactiveColor: gris,
            values: _values,
            min: 0,
            max: 100.0,
            onChanged: (RangeValues newValues){
              setState(() {
                 _values = newValues;
              _minPrice = _values.start.round();
              _maxprice = _values.end.round();
              });
             
            },
            ),
        ),
        Text('$_maxprice ',
        style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}