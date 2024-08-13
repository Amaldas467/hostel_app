import 'package:flutter/material.dart';

class ScrollableButtonsRow extends StatefulWidget {
  final List<Map<String, dynamic>> buttonData;

  const ScrollableButtonsRow({super.key, required this.buttonData});

  @override
  _ScrollableButtonsRowState createState() => _ScrollableButtonsRowState();
}

class _ScrollableButtonsRowState extends State<ScrollableButtonsRow> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.buttonData.map((data) {
                int index = widget.buttonData.indexOf(data);
                bool isSelected = _selectedIndex == index;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 45,
                      width: 105,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 241, 247),
                        border: Border.all(
                          color: isSelected
                              ? Colors.black
                              : const Color.fromARGB(255, 141, 139, 139),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data['text'],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(data['icon'], size: 18),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(left: 8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(
              Icons.tune,
              size: 24,
              color: Colors.black,
            ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              padding: EdgeInsets.all(16),
              backgroundColor: Color.fromARGB(255, 241, 241, 247),
            ),
          ),
        ),
      ],
    );
  }
}
