import 'package:timemanager/components/space_widget.dart';
import 'package:timemanager/utils/indexes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors.dart';

class FormTextField extends StatefulWidget {
  final String labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Function(String) validator;
  final bool isPassWordField;
  final String hintText;
  final Color errorBorder;
  final Color focusErrorBorder;
  final TextEditingController controller;
  final bool addMargin;
  final Color fillcolor;
  final errortxtclr;
  final String? errortxt;
  final int? maxLength;
  final readOnly;
  final bool isEdu;
  final Function(String) onChange;
  final String headerText;

  FormTextField({
    this.labelText = "",
    required this.textInputAction,
    this.addMargin = true,
    this.textInputType = TextInputType.name,
    this.hintText = "",
    this.isPassWordField = false,
    this.textCapitalization = TextCapitalization.words,
    required this.validator,
    required this.controller,
    this.errorBorder = Colors.red,
    this.focusErrorBorder = Colors.red,
    this.fillcolor = Colors.transparent,
    this.errortxtclr = Colors.red,
    this.readOnly = false,
    this.isEdu = false,
     this.errortxt,
    required this.headerText,
    required this.onChange,
    this.maxLength,
  });

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool _obscureText = true;

  FocusNode _focusNode = FocusNode();

  // Adds initialization and disposal to _focusNode
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // Toggles the password visibility
  void _toggle() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    var passwordVisibilityToggle = GestureDetector(
      onTap: _toggle,
      child: Container(
        width: 48,
        height: 44,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(width: 1, color: Colors.transparent),
          ),
        ),
        margin: const EdgeInsets.only(left: 14.0),
        child: Center(
          child: GestureDetector(
            onTap: _toggle,
            child: FaIcon(
              _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              size: 14,
              color: arrowbackColor,
            ),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headerText,
          // style: TextStyle(
          //   color: enumDarkBlue,
          // ),
        ),
        const VSpace(6),
        TextFormField(
          readOnly: widget.readOnly,
          focusNode: _focusNode,
          onTap: _requestFocus,
          cursorWidth: 1.8,
          cursorHeight: 18,
          controller: widget.controller,
          textCapitalization: widget.textCapitalization,
          keyboardAppearance: Brightness.light,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          onChanged: widget.onChange,
          maxLength: widget.maxLength,
          // style: TextStyle(color: enumGrey2),
          decoration: InputDecoration(
            errorText: widget.errortxt,
            counter: SizedBox(),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(left: 12, right: 12),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: .1,
              ),
            ),
            // hintStyle: TextStyle(
            //     color: enumGrey3, fontWeight: FontWeight.w500),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.focusErrorBorder, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.errorBorder, width: 1.5),
            ),
            errorStyle: GoogleFonts.dmSans(fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: grey4, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: primaryColor, width: 1.5),
            ),
            hintText: widget.hintText,
            labelText: widget.labelText,
            // labelStyle: TextStyle(
            //     color: enumGrey3, fontWeight: FontWeight.w500),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: widget.isPassWordField
                ? passwordVisibilityToggle
                : widget.isEdu
                ? const Icon(
              Icons.arrow_drop_down_outlined,
              size: 18,
            )
                : null,
          ),
          autofocus: false,
          obscureText: widget.isPassWordField ? _obscureText : false,
        ),
      ],
    );
  }
}