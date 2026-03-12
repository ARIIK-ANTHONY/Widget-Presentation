# AnimatedSwitcher Widget Demo

**AnimatedSwitcher** smoothly transitions between two different widgets with customizable fade, slide, and scale animations—perfect for status updates in production apps like delivery tracking.

## Quick Start

### Prerequisites
- Flutter SDK installed ([get Flutter](https://flutter.dev/docs/get-started/install))
- A device/emulator ready

### Run the App
```bash
flutter pub get
flutter run
```

## How It Works

This demo showcases an **order tracking interface** that toggles between:
- **Compact View**: Quick glimpse of order number and icon
- **Expanded View**: Full tracking details (status, ETA, courier name)

Tap the **"Show Details"** button to trigger the AnimatedSwitcher transition.

---

## Three Key Attributes

### 1. **`duration`** (900 milliseconds)
- **What it does**: Controls how long the incoming widget takes to animate in
- **Default**: No default animation
- **Visual effect**: Increasing it slows the transition; decreasing it speeds it up (try 300ms vs 2000ms)
- **Why adjust it**: Match animation speed to app tone (fast = snappy, slow = elegant)
- **In code**: `duration: const Duration(milliseconds: 900)`

### 2. **`transitionBuilder`**
- **What it does**: Customizes the animation effect—defines exactly how the widget enters
- **Default**: Basic fade-only animation
- **Visual effect**: This demo combines three effects:
  - **Fade**: Opacity gradually increases (transparent → opaque)
  - **Slide**: Widget moves upward from bottom (0.4 offset → 0)
  - **Scale**: Widget grows from 85% to 100% size
- **Why adjust it**: Create polished, branded transitions; e.g., flip, rotate, or bounce animations
- **In code**: Returns a chain of `FadeTransition → SlideTransition → ScaleTransition`

### 3. **`switchInCurve`** (easeOutCubic)
- **What it does**: Sets the easing curve for the entrance animation
- **Default**: Linear (constant speed)
- **Visual effect**:
  - `easeOutCubic` (used here): Quick start, then slows down (feels "snappy")
  - Other options: `easeInCubic` (slow start, speeds up), `bounceOut` (bouncy), `linear` (uniform)
- **Why adjust it**: Easing curves affect perceived smoothness and feel (professional vs playful)
- **In code**: `switchInCurve: Curves.easeOutCubic`

---

## Screenshots

### Compact View (Initial State)
![Compact View](screenshots/compact_view.png)

### Expanded View (After Transition)
![Expanded View](screenshots/expanded_view.png)

---

## Code Structure

- **`lib/main.dart`**: App entry point
- **`lib/screen/home.dart`**: Full AnimatedSwitcher implementation with detailed comments
  - `_buildCompactCard()`: Minimal card (order # + icon)
  - `_buildExpandedCard()`: Full details card (status, ETA, courier)

## Key Takeaway

**AnimatedSwitcher** is widely used in production apps for:
- Order/delivery status transitions
- Form validation feedback (error → success)
- Navigation state changes
- Filtering/sorting results updates

It eliminates jarring UI switches and provides a polished, professional feel.

---

## Resources

- [AnimatedSwitcher Documentation](https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html)
- [Curves Documentation](https://api.flutter.dev/flutter/animation/Curves-class.html)

---

**Presented**: March 12, 2026  
**Widget**: AnimatedSwitcher  
**Use Case**: Order Tracking UI with Smooth Transitions
