import 'package:ahangoapp/widgets/icon_button_ink.dart';
import 'package:flutter/material.dart';

class ButtonAD extends StatefulWidget {
  final String label;
  final Function(int counter) onAD;
  const ButtonAD(
    this.label, {
    super.key,
    required this.onAD,
  });

  @override
  State<ButtonAD> createState() => _ButtonADState();
}

class _ButtonADState extends State<ButtonAD> {
  int _counterPeople = 0;
  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border.all(color: cardColor.withOpacity(1)),
            borderRadius: BorderRadius.circular(10.0),
            color: cardColor.withOpacity(0.5),
          ),
          child: Row(
            children: [
              Text(widget.label,
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              IconButtonInk(
                size: 20,
                onTap: () {
                  setState(() {
                    if (_counterPeople > 0) {
                      _counterPeople--;
                    }
                  });
                  widget.onAD(_counterPeople);
                },
                icon: Icons.remove,
              ),
              const SizedBox(width: 7.0),
              Text('$_counterPeople',
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(width: 7.0),
              IconButtonInk(
                size: 20,
                onTap: () {
                  setState(() {
                    _counterPeople++;
                  });
                  widget.onAD(_counterPeople);
                },
                icon: Icons.add,
              ),
            ],
          ),
        )
      ],
    );
  }
}
