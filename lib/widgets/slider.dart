import 'package:flutter/material.dart';

class _SliderIndicatorPainter extends CustomPainter {
  final double position;
  _SliderIndicatorPainter(this.position);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(position, size.height / 2), 12, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(_SliderIndicatorPainter old) {
    return true;
  }
}

class SliderPicker extends StatefulWidget {
  SliderPicker({
    required this.width,
    super.key,
    required this.currentColor,
    required this.onClickUpdateColor,
  });

  final Function(Color) onClickUpdateColor;
  final double width;
  final Color currentColor;

  @override
  _SliderPickerState createState() => _SliderPickerState();
}

class _SliderPickerState extends State<SliderPicker> {
  double _colorSliderPosition = 0;
  double _shadeSliderPosition = 0;
  Color _currentColor = Colors.black;
  Color _shadedColor = Colors.black;

  _SliderPickerState();

  @override
  initState() {
    super.initState();
    _shadeSliderPosition = widget.width / 2; //center the shader selector
    _currentColor = widget.currentColor;
    _shadedColor = _calculateShadedColor(_shadeSliderPosition);
  }

  @override
  void didUpdateWidget(SliderPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentColor != oldWidget.currentColor) {
      setState(() {
        _currentColor = widget.currentColor;
        _shadedColor = _calculateShadedColor(_shadeSliderPosition);
      });
    }
    widget.onClickUpdateColor(_shadedColor);
  }

  _colorChangeHandler(double position) {
    //handle out of bounds positions
    if (position > widget.width) {
      position = widget.width;
    }
    if (position < 0) {
      position = 0;
    }
    setState(() {
      _colorSliderPosition = position;
      _shadedColor = _calculateShadedColor(_shadeSliderPosition);
    });
    widget.onClickUpdateColor(_shadedColor);
  }

  _shadeChangeHandler(double position) {
    //handle out of bounds gestures
    if (position > widget.width) position = widget.width;
    if (position < 0) position = 0;
    setState(() {
      _shadeSliderPosition = position;
      _shadedColor = _calculateShadedColor(_shadeSliderPosition);
    });
    widget.onClickUpdateColor(_shadedColor);
  }

  Color _calculateShadedColor(double position) {
    double ratio = position / widget.width;
    Color response = Colors.black;

    if (ratio > 0.5) {
      //Calculate new color (values converge to 255 to make the color lighter)
      int redVal = _currentColor.red != 255
          ? (_currentColor.red +
                  (255 - _currentColor.red) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      int greenVal = _currentColor.green != 255
          ? (_currentColor.green +
                  (255 - _currentColor.green) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      int blueVal = _currentColor.blue != 255
          ? (_currentColor.blue +
                  (255 - _currentColor.blue) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      response = Color.fromARGB(255, redVal, greenVal, blueVal);
    } else if (ratio < 0.5) {
      //Calculate new color (values converge to 0 to make the color darker)
      int redVal = _currentColor.red != 0
          ? (_currentColor.red * ratio / 0.5).round()
          : 0;
      int greenVal = _currentColor.green != 0
          ? (_currentColor.green * ratio / 0.5).round()
          : 0;
      int blueVal = _currentColor.blue != 0
          ? (_currentColor.blue * ratio / 0.5).round()
          : 0;
      response = Color.fromARGB(255, redVal, greenVal, blueVal);
    } else {
      //return the base color
      response = _currentColor;
    }

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragStart: (DragStartDetails details) {
              _shadeChangeHandler(details.localPosition.dx);
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              _shadeChangeHandler(details.localPosition.dx);
            },
            onTapDown: (TapDownDetails details) {
              _shadeChangeHandler(details.localPosition.dx);
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                width: widget.width,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [Colors.black, _currentColor, Colors.white]),
                ),
                child: CustomPaint(
                  painter: _SliderIndicatorPainter(_shadeSliderPosition),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
