# Flags - everywhere

Created by Parth Antala on 2024-07-06

## Overview
Flags - everywhere is an educational and interactive iOS app developed using SwiftUI. The app challenges users to identify the correct flag from a set of three options, improving their knowledge of world flags in a fun and engaging way.

## Features
- Interactive flag identification game.
- Dynamic background gradient changing based on answer correctness.
- Score tracking with visual feedback.
- Option to proceed to the next question or start over.

## Screenshots
Include some screenshots here to give a visual overview of the app.

## Getting Started

### Prerequisites
- Xcode 12 or later
- iOS 14 or later

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/flags-everywhere.git
    ```
2. Open the project in Xcode:
    ```bash
    cd flags-everywhere && open FlagsEverywhere.xcodeproj
    ```
3. Build and run the project on your preferred simulator or device.

## Usage
1. Launch the app to start the flag identification game.
2. Tap the flag that matches the given country name.
3. View your current score and correctness of your answer.
4. Tap "Next" to proceed to the next question or "Start Over" to reset the game.

## Code Overview

### Main Components
- `ContentView.swift`: The main view of the app, handling the user interface and game logic.
- `FlagImage.swift`: A custom view representing a flag image.

### Key Functions
- `flagTapped(_ number: Int)`: Checks if the tapped flag is the correct answer and updates the score.
- `askQuestion()`: Shuffles the flags and sets a new correct answer.
- `ButtonViewModifier`: A custom view modifier for styling buttons.
