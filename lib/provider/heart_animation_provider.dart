import 'package:flutter/material.dart';

/// Provider class for managing heart animation state.
///
/// Extends [ChangeNotifier] to provide change notification to listeners.
class HeartAnimationProvider extends ChangeNotifier {
  bool _isAnimating = false; // Flag to track animation state

  /// Getter for retrieving the current animation state.
  bool get isAnimating => _isAnimating;

  /// Toggles the visibility of animations.
  ///
  /// Flips the value of [_isAnimating] to its opposite.
  /// Calls [notifyListeners] to notify listeners of the state change.
  void toggleAnimationsVisibility() {
    _isAnimating = !_isAnimating; // Toggle animation state
    notifyListeners(); // Notify listeners of state change
  }
}
