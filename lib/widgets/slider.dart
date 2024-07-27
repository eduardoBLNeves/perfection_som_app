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
    required this.onUpdateSlider,
    required this.onClickUpdateColor,
    required this.sliderPosition,
  });

  final Function(Color) onClickUpdateColor;
  final Function(double) onUpdateSlider;
  final double width;
  final double sliderPosition;
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

    double position = widget.sliderPosition == double.minPositive
        ? _shadeSliderPosition
        : widget.sliderPosition;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _currentColor = widget.currentColor;
      _shadeSliderPosition = position;
      _shadedColor = _calculateShadedColor(_shadeSliderPosition);
      widget.onClickUpdateColor(_shadedColor);
    });
  }

  _colorChangeHandler(double position) {
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
    if (position > widget.width) position = widget.width;
    if (position < 0) position = 0;
    setState(() {
      _shadeSliderPosition = position;
      _shadedColor = _calculateShadedColor(_shadeSliderPosition);
    });
    widget.onClickUpdateColor(_shadedColor);
    widget.onUpdateSlider(position);
  }

  Color _calculateShadedColor(double position) {
    double ratio = position / widget.width;
    Color response = Colors.black;
    int redVal = 255, greenVal = 255, blueVal = 255;
    if (ratio > 0.5) {
      //Calculate new color (values converge to 255 to make the color lighter)
      redVal = _currentColor.red != 255
          ? (_currentColor.red +
                  (255 - _currentColor.red) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      greenVal = _currentColor.green != 255
          ? (_currentColor.green +
                  (255 - _currentColor.green) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      blueVal = _currentColor.blue != 255
          ? (_currentColor.blue +
                  (255 - _currentColor.blue) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      response = Color.fromARGB(255, redVal, greenVal, blueVal);
    } else if (ratio < 0.5) {
      //Calculate new color (values converge to 0 to make the color darker)
      redVal = _currentColor.red != 0
          ? (_currentColor.red * ratio / 0.5).round()
          : 0;
      greenVal = _currentColor.green != 0
          ? (_currentColor.green * ratio / 0.5).round()
          : 0;
      blueVal = _currentColor.blue != 0
          ? (_currentColor.blue * ratio / 0.5).round()
          : 0;
      response = Color.fromARGB(255, redVal, greenVal, blueVal);
    } else {
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
