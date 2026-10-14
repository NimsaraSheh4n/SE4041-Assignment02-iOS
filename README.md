# SE4041 Assignment 02 - Part A

## Smart Campus Navigator

Smart Campus Navigator is an iOS application developed for the SE4041 Mobile Application Design and Development module.

The application helps university students and campus visitors locate important facilities, explore an interactive campus map, view detailed location information, and save frequently used places.

---

## Project Information

**Module:** SE4041 - Mobile Application Design and Development

**Assignment:** Assignment 02 - Part A

**Platform:** iOS

**Application:** Smart Campus Navigator

**Development Framework:** SwiftUI

---

## Main Features

- Home dashboard
- Campus location search
- Interactive MapKit campus map
- Location category filtering
- Campus location annotations
- Place detail screen
- Favourite location management
- Persistent favourite storage using Core Data
- Saved Places screen
- Swipe-to-delete
- Custom SwiftUI components
- Custom ViewModifiers
- SwiftUI animations and transitions
- Dark Mode support
- Dynamic Type support
- VoiceOver accessibility support

---

## Application Screens

### 1. Home

The Home screen provides:

- Search functionality
- Quick access to Campus Map
- Quick access to Saved Places
- Campus location cards
- Navigation to Place Details

### 2. Campus Map

The Campus Map screen provides:

- Interactive MapKit map
- Campus location markers
- Category filtering
- Map zoom and pan
- Animated location preview
- Navigation to Place Details

### 3. Place Details

The Place Details screen displays:

- Location name
- Category
- Description
- Map preview
- Geographic coordinates
- Favourite save/remove functionality

### 4. Saved Places

The Saved Places screen provides:

- Persistent favourite locations
- Navigation to Place Details
- Swipe-to-delete
- Edit functionality
- Empty-state interface

---

## Technologies Used

- Swift
- SwiftUI
- NavigationStack
- MapKit
- Core Data
- CoreLocation
- XCTest
- XCUITest

---

## Advanced UI and UX

The application includes:

- Custom reusable location cards
- Custom ViewModifiers
- Native SwiftUI animations
- Animated map location previews
- Adaptive system colours
- Dark Mode support
- Dynamic Type-compatible typography
- VoiceOver accessibility labels and hints

---

## Data Persistence

Core Data is used to store favourite campus locations.

Saved places remain available after the application is closed and relaunched.

---

## MapKit Integration

MapKit is used to provide:

- Interactive campus navigation
- Custom location annotations
- Location filtering
- Map previews
- Coordinate-based campus location display

---

## Project Structure

```text
SE4041-Assignment02-iOS/
│
├── App/
│   └── SmartCampusNavigatorApp.swift
│
├── Components/
│   └── LocationCard.swift
│
├── Data/
│   └── SamplePlaces.swift
│
├── Models/
│   ├── Place.swift
│   └── FavoritePlaceEntity.swift
│
├── Persistence/
│   └── PersistenceController.swift
│
├── Theme/
│   └── AppTheme.swift
│
├── Views/
│   ├── HomeView.swift
│   ├── CampusMapView.swift
│   ├── PlaceDetailView.swift
│   └── SavedPlacesView.swift
│
├── Tests/
│   └── SmartCampusNavigatorTests.swift
│
├── UITests/
│   └── SmartCampusNavigatorUITests.swift
│
├── docs/
│   ├── ProjectPlan.md
│   ├── ScreenFlow.md
│   ├── DataModel.md
│   ├── UserAcceptanceTesting.md
│   └── PerformanceTesting.md
│
└── README.md
