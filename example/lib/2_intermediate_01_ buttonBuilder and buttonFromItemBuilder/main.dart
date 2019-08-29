import 'package:flutter/material.dart';
import 'package:selection_menu/selection_menu.dart';

import '../data/FlatColor.dart';

// Reading previous Examples before this one is recommended.
//
// Code from previous example will have their comments or sections removed, simplified, and
// moved to the end of the file to allow meaningful code to stay up top. Please
// do not consider this example as an optimal way to place your code.
//
// main function has been moved to the end.

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SelectionMenu<FlatColor>(
        viewComponentBuilders:
            // Since almost all builders are required for the Widget to function
            // We extend a predefined ViewComponentBuilders with copyWith and
            // override methods we need.
            DialogViewComponentBuilders<FlatColor>().copyWith(
          buttonBuilder: _buttonBuilder,
          // This builder is used to build the default button.
          // If SelectionMenu.showSelectedItemAsButton is true and
          // SelectionMenu.initiallySelectedItemIndex is null, this builder is used.
          //
          // Defined below for the sake of brevity.

          buttonFromItemBuilder: _buttonFromItemBuilder,
          // This builder is used to build the button, only when an item is selected
          // and SelectionMenu.showSelectedItemAsButton is set to true.
          // If this builder is null, SelectionMenu uses SelectionMenu.itemBuilder
          // in its place.
          //
          // Defined below for the sake of brevity.
        ),
        itemsList: colors,
        itemBuilder: this.itemBuilder,
        onItemSelected: this.onItemSelected,
        showSelectedItemAsButton: true,
      ),
    );
  }

  static ButtonBuilder _buttonBuilder =
      (BuildContext context, ToggleMenu toggleMenu) {
    return RaisedButton(
      onPressed: toggleMenu,
      // On button press make sure to call the ToggleMenu callback. This will
      // cause the menu to open/close.

      color: Colors.white,
      child: Text("Select Color"),
    );
  };

  static ButtonFromItemBuilder<FlatColor> _buttonFromItemBuilder =
      (BuildContext context, ToggleMenu toggleMenu, FlatColor color) {
    return RaisedButton(
      onPressed: toggleMenu,
      // On button press make sure to call the ToggleMenu callback. This will
      // cause the menu to open/close.

      color: Color(color.hex),
      child: Text(
        color.name,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  };

  //region From Previous Example

  Widget itemBuilder(BuildContext context, FlatColor color) {
    TextStyle textStyle = Theme.of(context).textTheme.body1;

    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipOval(
            child: Container(
              color: Color(color.hex),
              height: 20,
              width: 20,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.only(left: 3),
              child: Text(
                color.name,
                style: textStyle,
              ),
            ),
          ),
          Text(
            ('#' + color.hex.toRadixString(16)).toUpperCase(),
            style: textStyle.copyWith(
              color: Colors.grey.shade600,
              fontSize: textStyle.fontSize * 0.75,
            ),
          ),
        ],
      ),
    );
  }

  bool itemSearchMatcher(String searchString, FlatColor color) {
    return color.name.toLowerCase().contains(searchString.trim().toLowerCase());
  }

  void onItemSelected(FlatColor color) {
    print(color.name);
  }

//endregion
}

//region From Previous Example
void main() => runApp(
      MaterialApp(
        theme: ThemeData.light().copyWith(
          accentColor: Colors
              .redAccent, // Used by the default Dialog Style of SelectionMenu
        ),
        home: Material(
          child: Center(
            child: ExampleApp(),
          ),
        ),
      ),
    );

List<FlatColor> colors = FlatColors.colors;
//endregion