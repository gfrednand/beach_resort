import 'package:flutter/material.dart';

class CounterFormField extends FormField<int> {
  CounterFormField(
      {FormFieldSetter<int> onSaved,
      FormFieldValidator<int> validator,
      int initialValue = 0,
      AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<int> state) {
              return Column(
                children: <Widget>[
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          icon: Icon(
                            Icons.remove,
                          ),
                          onPressed: () {
                            state.didChange(state.value - 1);
                          },
                        ),
                      ),
                      Text(state.value.toString()),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            state.didChange(state.value + 1);
                          },
                        ),
                      ),
                    ],
                  ),
                  state.hasError
                      ? Text(
                          state.errorText,
                          style: TextStyle(color: Colors.red),
                        )
                      : Container()
                ],
              );
            });
}
