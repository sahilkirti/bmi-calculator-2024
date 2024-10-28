# BMI Calculator App

A **Flutter-based BMI Calculator** app that provides users with a BMI calculation and personalized health advice based on their BMI category. This project is designed to stand out from typical BMI calculators by offering tailored health tips, helping users make informed health choices.

---

## Features

- **BMI Calculation**: Input height (in cm) and weight (in kg) to calculate Body Mass Index (BMI).
- **Personalized Health Tips**: Based on BMI categories (_Underweight_, _Normal_, _Overweight_, _Obese_), the app provides relevant health advice and motivation.
- **Intuitive UI**: A visually appealing interface with customized widgets and smooth gradients for an enhanced user experience.
- **BMI Meter**: Visual representation of BMI with a color-coded meter indicating the BMI category.

---

## Getting Started

Follow these instructions to get a local copy of the project up and running.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Any IDE (e.g., VS Code, Android Studio)

### Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/sahilkirti/bmi-calculator-2024
    cd bmi-calculator-2024
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Run the app**:
    ```bash
    flutter run
    ```

---

## Directory Structure

Here's an overview of the directory structure for this project:

```plaintext
.
├── lib
│   ├── main.dart                   # Main entry point of the application
│   ├── screens
│   │   └── bmi_calculator.dart      # Core BMI Calculator screen with BMI calculations and personalized tips
│   └── widgets                      # Custom widgets directory
│       ├── custom_button.dart       # Reusable custom button widget
│       ├── rounded_card.dart        # Rounded card widget for consistent styling
│       └── bmi_meter.dart           # BMI meter widget displaying the BMI level with color indication
├── pubspec.yaml                     # Project dependencies and assets
└── README.md                        # Project documentation
