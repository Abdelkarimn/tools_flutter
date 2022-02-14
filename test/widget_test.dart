import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_2/my_app.dart';

void main() {
  group("calculator", () {
    testWidgets('initial State', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      expect(find.text('0.0'), findsOneWidget);
      expect(find.text(""), findsOneWidget);
      expect(find.text("1"), findsOneWidget);
      expect(find.text("2"), findsOneWidget);
      expect(find.text("3"), findsOneWidget);
      expect(find.text("4"), findsOneWidget);
      expect(find.text("5"), findsOneWidget);
      expect(find.text("6"), findsOneWidget);
      expect(find.text("7"), findsOneWidget);
      expect(find.text("8"), findsOneWidget);
      expect(find.text("9"), findsOneWidget);
      expect(find.text("0"), findsOneWidget);
      expect(find.text("+"), findsOneWidget);
      expect(find.text("-"), findsOneWidget);
      expect(find.text("*"), findsOneWidget);
      expect(find.text("-"), findsOneWidget);
    });

    testWidgets(
        'first Number with one digit displays on operationtext fieled and no result yet',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("1")));
      await tester.pump();
      expect(find.text('0.0'), findsOneWidget);
      expect(find.text("1"), findsNWidgets(2));
    });

    testWidgets(
        'first Number with two digits displays on operationtext without do any operation  and no result yet',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("2")));
      await tester.pump();
      expect(find.text('0.0'), findsOneWidget);
      expect(find.text("12"), findsOneWidget);
    });

    testWidgets(
        'when the first number with one digit inserted then enter pressed the result will be the same number',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("2")));

      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsNothing);
      expect(find.text("2.0"), findsOneWidget);
      expect(find.text("2"), findsNWidgets(2));
    });

    testWidgets(
        'operation  will not  display on operationtext when it press firstly and no result yet',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("+")));
      await tester.pump();
      expect(find.text('0.0'), findsOneWidget);
      expect(find.text("+"), findsNWidgets(2));
    });

    testWidgets(
        'operation  will not  display on operationtext when it press after 0 and no result yet',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("0")));
      await tester.tap(find.byKey(Key("+")));
      await tester.pump();
      expect(find.text('0.0'), findsOneWidget);
      expect(find.text("+"), findsOneWidget);
    });

    testWidgets(
        'no operation will done after insert the first number then operation then press enter',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("2")));
      await tester.tap(find.byKey(Key("+")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsOneWidget);
      expect(find.text("+"), findsOneWidget);
      expect(find.text("2+"), findsOneWidget);
    });

    testWidgets("sum two number with one digit", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("2")));
      await tester.tap(find.byKey(Key("+")));
      await tester.tap(find.byKey(Key("3")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsNothing);
      expect(find.text("2+3"), findsOneWidget);
      expect(find.text("5.0"), findsOneWidget);
    });

    testWidgets("sum two number with two digits", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("+")));
      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsNothing);
      expect(find.text("11+11"), findsOneWidget);
      expect(find.text("22.0"), findsOneWidget);
    });

    testWidgets("multiply two number with one digit",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("2")));
      await tester.tap(find.byKey(Key("*")));
      await tester.tap(find.byKey(Key("5")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsNothing);
      expect(find.text("2*5"), findsOneWidget);
      expect(find.text("10.0"), findsOneWidget);
    });

    testWidgets("multiply two number with two digits",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("*")));
      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("0")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsNothing);
      expect(find.text("11*10"), findsOneWidget);
      expect(find.text("110.0"), findsOneWidget);
    });

    testWidgets("subtract two number with one digit",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("5")));
      await tester.tap(find.byKey(Key("-")));
      await tester.tap(find.byKey(Key("2")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsNothing);
      expect(find.text("5-2"), findsOneWidget);
      expect(find.text("3.0"), findsOneWidget);
    });

    testWidgets("subtract two number when seconf greater than first",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("2")));
      await tester.tap(find.byKey(Key("-")));
      await tester.tap(find.byKey(Key("5")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsNothing);
      expect(find.text("2-5"), findsOneWidget);
      expect(find.text("-3.0"), findsOneWidget);
    });

    testWidgets("subtract two number with two digits",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("5")));
      await tester.tap(find.byKey(Key("-")));
      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsNothing);
      expect(find.text("15-11"), findsOneWidget);
      expect(find.text("4.0"), findsOneWidget);
    });

    
   testWidgets("div two number with one digit and int result",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("6")));
      await tester.tap(find.byKey(Key("/")));
      await tester.tap(find.byKey(Key("2")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsNothing);
      expect(find.text("6/2"), findsOneWidget);
      expect(find.text("3.0"), findsOneWidget);
    });

    testWidgets("div two number with two digits",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("3")));
      await tester.tap(find.byKey(Key("0")));
      await tester.tap(find.byKey(Key("/")));
      await tester.tap(find.byKey(Key("1")));
      await tester.tap(find.byKey(Key("0")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      expect(find.text('0.0'), findsNothing);
      expect(find.text("30/10"), findsOneWidget);
      expect(find.text("3.0"), findsOneWidget);
    });
     

     testWidgets("div on zero should not done",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Calc()));

      await tester.tap(find.byKey(Key("6")));
      await tester.tap(find.byKey(Key("/")));
      await tester.tap(find.byKey(Key("0")));
      await tester.tap(find.byKey(Key("enter")));

      await tester.pump();
      
      expect(find.text("div on zero forbidden"), findsOneWidget);
      
      await tester.tap(find.text("cancel"));
      await tester.pump();
      expect(find.text('0.0'), findsOneWidget);
      expect(find.text(""), findsOneWidget);
         

    });
    
  });

  
}
