// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Ecommerce app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app loads without crashing
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Verify that the home page loads with expected elements
    expect(find.text('July 18,2025'), findsOneWidget);
    expect(find.text('Hello,Mekdelawit Abdina'), findsOneWidget);
    expect(find.text('Avaliable Products'), findsOneWidget);
    
    // Verify that the floating action button exists
    expect(find.byType(FloatingActionButton), findsOneWidget);
    
    // Verify that the search button exists
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}
