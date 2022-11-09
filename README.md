# Assignment 7 - Counter

## Explain what is meant by stateless widget and stateful widget and explain the difference between them.
Widgets that cannot be altered or will never change are referred to as stateless widgets. Stateless widgets are those whose state cannot be changed after construction. Once they are created, these widgets cannot be altered. Dynamic or modifiable widgets are stateful widgets. Stateful widgets, as opposed to stateless ones, can alter their look, change their colors, add more rows, etc. Thus, it follows that any widget that has the ability to modify is a stateful widget.

## Mention what widgets you use in this project and explain their functions.
1. Text : to display and style text
2. Scaffold : Implements the basic Material Design visual layout structure.
3. Center : A widget that centers its child within itself.
4. Column : A widget that displays its children in a vertical array.
5. Row : A widget that displays its children in a horizontal array.
6. TextStyle : An immutable style describing how to format and paint text
7. Container : A convenience widget that combines common painting, positioning, and sizing widgets.
8. FloatingActionButton : A Material Design floating action button.

## What is the function of setState()? Explain what variables can be affected by the function.
Within a State class, setState is called. State is only a StatefulWidget's information. A State Object exists in every StatefulWidget. The variables and functions that we declare inside a StatefulWidget are tracked by this State Object. Actually, the Element Object of the Widget that corresponds to the State Object manages it. Use State Object to alter the UI because StatefulWidget itself is immutable (cannot be changed). _counter is affected by the function, since it will always changing the number, also trigger the text to display either odd/even.

## Explain the difference between const and final.
Final field or variable initialization is required. The final variable's value cannot be modified once it has been allocated. Final changes the variables. while const changes the value. When the complete state of the object is fully determined at compile time, const defines the state. The item will be frozen and unchangeable while it is being compiled. Const is immutable, therefore it can only allocate one memory area at a time.

## Explain how you implement the checklist above.
1. Make new flutter app ``` flutter create counter_7```
2. Change the title of the app
3. Make ```_decrementCounter()``` method
```
  void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
        if (_counter == 0) {
          _decButton = false;
        }
      }
    });
    _checkCounter();
  }
```
4. Make ```_checkCounter()``` method
```
  void _checkCounter() {
    setState(() {
      if (_counter % 2 == 0) {
        _message = "EVEN";
        _textColor = Colors.red;
      }
      else {
        _message = "ODD";
        _textColor = Colors.blue;
      }
    });
  }
```
5. Create new button, and also implement the visibility
```
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Visibility(
                visible: _decButton,
                child: FloatingActionButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.remove),
                ),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              child: Icon(Icons.add),
            ),
          ],
        ),
      )
```
