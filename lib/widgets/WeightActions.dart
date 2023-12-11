import 'package:flutter/material.dart';

class WeightActions extends StatefulWidget {
  @override
  _WeightActionsState createState() => _WeightActionsState();
}

class _WeightActionsState extends State<WeightActions> {
  String _from = 'Kilograms';
  String _to = 'pound';
  double _value = 0;
  double _answer = 0;

  void convert(String from, String to, double value) async {
    if (value == 0.0) {
      return;
    }
    if (from == 'Kilograms' && to == 'pound') {
      setState(() {
        _answer = value * 2.205;
      });
    }
    if (from == 'pound' && to == 'Kilograms') {
      setState(() {
        _answer = value / 2.205;
      });
    }
    if (from == 'ounce' && to == 'Kilograms') {
      setState(() {
        _answer = value / 35.274;
      });
    }
    if (from == 'Kilograms' && to == 'ounce') {
      setState(() {
        _answer = value * 35.274;
      });
    }

    if (from == to) {
      setState(() {
        _answer = value;
      });
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: Column(
        children: [
          Row(
            children: [
              DropdownButton(
                value: _from,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Kilograms",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'Kilograms',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "pounds",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'pounds',
                  ),
                ],
                hint: Text('Weight Scale'),
                onChanged: (from) {
                  setState(() {
                    _from = from!;
                  });
                },
              ),
              SizedBox(
                width: 100,
              ),
              DropdownButton(
                value: _to,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Kilograms",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'Kilograms',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "pound",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'pound',
                  ),
                ],
                hint: Text('weight Scale'),
                onChanged: (to) {
                  setState(() {
                    _to = to!;
                  });
                },
              )
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width * 0.30,
                child: TextField(
                  cursorHeight: 20,
                  onSubmitted: (value) =>
                      convert(_from, _to, double.parse(value)),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: '  Enter value...',
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                  onChanged: (value) {
                    setState(() {
                      _value = double.tryParse(value)!;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                _from,
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                '=',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.grey,
                ),
                width: MediaQuery.of(context).size.width * 0.21,
                child: Text(
                  _answer.toStringAsFixed(3),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                _to == 'pound' ? 'pound' : _to,
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
            ),
            onPressed: () => convert(_from, _to, _value),
            child: Text(
              'Convert',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
