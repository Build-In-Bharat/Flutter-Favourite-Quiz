import 'package:flutter/material.dart';

/// Provider class for managing the current page number in a questionnaire.
///
/// Extends [ChangeNotifier] to provide change notification to listeners.
class QuestionPageProvider extends ChangeNotifier {
  int _pageNumber = 0; // Variable to store the current page number

  /// Getter for retrieving the current page number.
  int get pageNumber => _pageNumber;

  /// Updates the current page number to [newPageNumber].
  ///
  /// Sets [_pageNumber] to [newPageNumber].
  /// Calls [notifyListeners] to notify listeners of the page number update.
  void updatePage(int newPageNumber) {
    _pageNumber = newPageNumber; // Update page number
    notifyListeners(); // Notify listeners of page number change
  }
}
