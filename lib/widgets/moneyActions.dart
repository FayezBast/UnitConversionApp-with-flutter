import 'package:flutter/material.dart';

class moneyActions extends StatefulWidget {
  @override
  _MoneyActionsState createState() => _MoneyActionsState();
}

class _MoneyActionsState extends State<moneyActions> {
  String _from = 'Lebanese Lira';
  String _to = 'Us Dollar';
  double _value = 0;
  double _answer = 0;

  void convert(String from, String to, double value) async {
    if (value == 0.0) {
      return;
    }
    if (from == 'Lebanese Lira' && to == 'Us Dollar') {
      setState(() {
        _answer = value / 89000;
      });
    }
    if (from == 'Us Dollar' && to == 'Lebanese Lira') {
      setState(() {
        _answer = value * 89000;
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
                      "Lebanese Lira",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'Lebanese Lira',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Us Dollar",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'Us Dollar',
                  ),
                ],
                hint: Text('Conversion Scale'),
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
                      "Us Dollar",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'Us Dollar',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Lebanese Lira",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'Lebanese Lira',
                  ),
                ],
                hint: Text('Conversion Scale'),
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
                _to == 'Us Dollar' ? 'Us Dollar' : _to,
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
