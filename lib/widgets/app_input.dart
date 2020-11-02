import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    Key key,
    this.controller,
    this.password = false,
    this.label,
    this.icon,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.isReadOnly = false,
    this.onChanged,
    this.formatter,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final bool password;
  final String label;
  final bool isReadOnly;
  final IconData icon;
  final TextInputType textInputType;
  final Function validator;
  final Function(String) onChanged;
  final TextInputFormatter formatter;
  final Function enterPressed;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;

  @override
  _AppInputState createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isPassword;
  double fieldHeight = 55;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: fieldHeight,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: widget.isReadOnly
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[100])
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200]),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: isPassword,
                  readOnly: widget.isReadOnly,
                  keyboardType: widget.textInputType,
                  textInputAction: widget.textInputAction,
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  focusNode: widget.fieldFocusNode,
                  inputFormatters:
                      widget.formatter != null ? [widget.formatter] : null,
                  onEditingComplete: () {
                    if (widget.enterPressed != null) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      widget.enterPressed();
                    }
                  },
                  onFieldSubmitted: (value) {
                    if (widget.nextFocusNode != null) {
                      widget.nextFocusNode.requestFocus();
                    }
                  },
                  // style: TextStyle(
                  //   fontSize: 20,
                  // ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: widget.icon != null
                        ? Icon(
                            widget.icon,
                          )
                        : null,
                    labelText: !widget.isReadOnly ? widget.label : null,
                    hintText: widget.isReadOnly ? widget.label : null,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  isPassword = !isPassword;
                }),
                child: widget.password
                    ? Container(
                        width: fieldHeight,
                        height: fieldHeight,
                        alignment: Alignment.center,
                        child: Icon(isPassword
                            ? Icons.visibility
                            : Icons.visibility_off))
                    : Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
