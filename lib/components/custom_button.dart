import 'package:timemanager/utils/indexes.dart';
import 'package:flutter/services.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function onTap;
  final Color color;
  final Color? textColor, loadingColor;
  final borderColor;
  final fontSize;
  final fontWeight;
  final fontStyle;
  bool isLoading;
  final isLoadingText;
  EdgeInsets padding;

  // bool isGoogleSignup;
  // bool isLinkedInSignup;

  CustomButton({
    Key? key,
    this.padding = const EdgeInsets.symmetric(horizontal: 3.0),
    this.text = "Continue",
    this.fontSize = 15.0,
    this.fontWeight = FontWeight.w600,
    this.fontStyle = FontStyle.normal,
    required this.onTap,
    this.color = Colors.green,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.borderColor = Colors.white,
    this.isLoadingText,
     this.loadingColor,
    // bool isGoogleSignup = false,
    // bool isLinkedInSignup = true,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTapDown: (_) => HapticFeedback.vibrate(),
      onTap: () {
        widget.onTap();
        setState(() {
          if (widget.isLoading != false) {
            widget.isLoading = true;
          } else {
            widget.isLoading = false;
          }
        });
      },
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: widget.isLoading ? widget.color.withOpacity(.5) : widget.color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                  widget.isLoading
                      ? widget.isLoadingText ?? "Loading..."
                      : widget.text,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: widget.textColor,
                  )),
            ),
            widget.isLoading
                ? Container(
              margin: EdgeInsets.only(left: 12),
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                valueColor: AlwaysStoppedAnimation(
                    widget.loadingColor ?? Colors.white),
              ),
            )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}