import 'package:flutter/material.dart';

class CustomSliderWidget extends StatefulWidget {
  final Function() booked;
  double value;
  CustomSliderWidget({
    super.key,
    required this.booked,
    this.value = 0.0,
  });

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  var _maxWidth = 0.0;
  var _width = 0.0;
  // var _value = 0.0;
  var _booked = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        _maxWidth = constraint.maxWidth;
        return Container(
            decoration: BoxDecoration(
              color: _booked ? Colors.greenAccent : Colors.blueAccent,
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              border: Border.all(
                  color: _booked ? Colors.greenAccent : Colors.blueAccent),
            ),
            height: 60,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    _booked ? "Booked" : "Slide to book",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                AnimatedContainer(
                  width: _width <= 55 ? 55 : _width,
                  duration: const Duration(
                    milliseconds: 100,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      GestureDetector(
                        onVerticalDragUpdate: onDrag,
                        onVerticalDragEnd: onDragEnd,
                        child: Center(
                          child: Container(
                            height: 55,
                            width: 55,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }

  void onDrag(DragUpdateDetails details) {
    setState(() {
      widget.value = (details.globalPosition.dx) / _maxWidth;
      _width = _maxWidth * widget.value;
    });
  }

  void onDragEnd(DragEndDetails details) {
    if (widget.value > 0.9) {
      widget.value = 1;
      widget.booked();
    } else {
      widget.value = 0;
    }
    setState(() {
      _width = _maxWidth * widget.value;
      _booked = widget.value > .9;
    });
  }
}
