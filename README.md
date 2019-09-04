# selection_menu

A highly customizable selection/select menu to choose an item from a list.

## Getting Started

The package provides two libraries:
* selection_menu: Provides Widgets
* components_configurations: Provides styles for Widgets

The image shows the same SelectionMenu Widget with three different 
ComponentsConfigurations.
![Select Menu in different styles](https://i.imgur.com/a5FfkD6.gif)

See the API Reference for details.

### Basic Usage

```dart
import 'package:selection_menu/selection_menu.dart';

SelectionMenu<String>(
    itemsList: <String>['A','B','C'],
    onItemSelected: (String selectedItem)
    {
    print(selectedItem);
    },
    itemBuilder: (BuildContext context, String item, OnItemTapped onItemTapped)
    {
       return Material(
         InkWell(
           onTap: onItemTapped,
           child: Text(item),
         ),
       ); 
    },
    // other Properties...
);
 ```

**Using A ComponentsConfiguration**
 
```dart
import 'package:selection_menu/selection_menu.dart';

// IMPORT this package to get access to configuration classes.
import 'package:selection_menu/components_configurations.dart';

SelectionMenu<String>(
  itemsList: <String>['A','B','C'],
  onItemSelected: (String selectedItem)
  {
    print(selectedItem);
  },
  itemBuilder: (BuildContext context, String item, OnItemTapped onItemTapped)
  {
    return Material(
      InkWell(
        onTap: onItemTapped,
        child: Text(item),
      ),
    );
  },
  componentsConfigurations: DropdownComponentsConfigurations<String>(),
);
```

## Customization

The menu is divided into parts called `Components` which allows to
change one part while the others remain intact.

<img src="https://i.imgur.com/QL67eib.jpg" width="658.5" height="384"/>

I recommend reading the examples because there are a lot of things to
cover and an intro page shouldn't be that long.

### Examples

**A series of brief examples can be found 
[here](https://github.com/HussainTaj-W/flutter-package-selection_menu/tree/master/example).**