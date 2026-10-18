# SE4041 Assignment 02 - Part A

## Smart Campus Navigator

Smart Campus Navigator is an iOS application developed for the SE4041 Mobile Application Design and Development module.

The application helps people find their way around a university campus: it lets them search for facilities, explore them on an interactive MapKit map, read details about each location and save frequently used places for quick access.

---

## Purpose and Target Audience

**Purpose:** provide a simple, accessible way to locate and remember important campus facilities.

**Target audience:**

- Students
- Staff
- Visitors
- New campus users

---

## Project Information

| Item | Value |
|---|---|
| Module | SE4041 - Mobile Application Design and Development |
| Assignment | Assignment 02 - Part A |
| Platform | iOS (iPhone) |
| Application | Smart Campus Navigator |
| UI Framework | SwiftUI |

---

## Features

- **Home screen** with app title, search, quick-access actions and a list of campus locations
- **Search** of campus locations by name or category (case-insensitive), with a "No Locations Found" empty state
- **Interactive campus map** (MapKit) with a custom annotation for every location
- **Category filtering** on the map (All, Library, Lecture Hall, Laboratory, Cafeteria, Administration, Student Services)
- **Map location preview card** with a button to open Place Details
- **Place Details screen** with name, category, description, a map preview and the coordinates
- **Favourites:** save and remove a place from the Place Details screen
- **Saved Places screen** backed by Core Data, with swipe-to-delete, an Edit button and an empty state
- **Custom SwiftUI component and modifiers** (`LocationCard`, `campusCardStyle()`, `primaryActionStyle()`)
- **Animations:** spring animations for map selection and favourite toggling, and a sliding map preview card
- **Accessibility:** VoiceOver labels and hints, accessibility identifiers for UI testing, and icon sizes that scale with Dynamic Type
- **Adaptive appearance:** system colours and semantic fonts are used, so the interface follows the system light/dark setting

### Not implemented

- Turn-by-turn directions or routing
- User location tracking
- A backend or online data source (campus data is bundled in the app)

---

## Application Screens

1. **Home** - search, quick access to the Campus Map and Saved Places, and the campus location list.
2. **Campus Map** - map with annotations, category filter bar and a preview card.
3. **Place Details** - information, map preview and the favourite button.
4. **Saved Places** - the persisted list of favourite places.

All screens are reached through a single `NavigationStack` that starts at Home.

---

## Technologies

- Swift
- SwiftUI
- NavigationStack
- MapKit
- Core Data
- XCTest / XCUITest

---

## Requirements

- A Mac with Xcode (the version used for the final validation supports the iOS 17 MapKit/SwiftUI APIs the app relies on, e.g. `Map` with `MapCameraPosition` and `ContentUnavailableView`)
- iOS 17 or later Simulator or device

---

## Important: Xcode project file

> **The committed Xcode project file (`SmartCampusNavigator.xcodeproj`) still needs to be restored into `XcodeProject/` before this repository is fully buildable straight from GitHub.**
>
> The project was built, run and tested successfully in Xcode on macOS, but the `.xcodeproj` is not currently present in this repository. See [docs/XcodeMigrationChecklist.md](docs/XcodeMigrationChecklist.md) for the steps.

The Swift source files are present twice: in the top-level folders (`App/`, `Views/`, ...) and in `XcodeProject/`. The copies are intended to be identical.

---

## Build, Run and Test

Once `SmartCampusNavigator.xcodeproj` is in `XcodeProject/`:

1. Clone the repository and open `XcodeProject/SmartCampusNavigator.xcodeproj` in Xcode.
2. Select the **SmartCampusNavigator** scheme and an iPhone Simulator.
3. Press **Cmd + R** to build and run.
4. Press **Cmd + U** to run the unit tests and UI tests.

Command line equivalent (adjust the simulator name to one installed on your Mac):

```bash
xcodebuild test \
  -project XcodeProject/SmartCampusNavigator.xcodeproj \
  -scheme SmartCampusNavigator \
  -destination 'platform=iOS Simulator,name=iPhone 15'
```

If the project file is not yet available, follow [docs/XcodeMigrationChecklist.md](docs/XcodeMigrationChecklist.md) to recreate it and attach the existing source and test files.

---

## Testing Status

| Area | Status |
|---|---|
| Build and run in Xcode on macOS | Completed successfully |
| Original 5 Part A unit tests | Passed |
| UI tests | 2 UI tests passed in the final validation session |
| Manual simulator navigation (Home, Campus Map, Place Details, Saved Places) | Checked |
| Unit and UI tests added or changed after that session (stable IDs, favourite removal, identifier-based UI tests) | **Not yet run - must be run on a Mac** |
| Formal external-user UAT | Not conducted |
| Instruments / profiling | Not conducted |

Details are in [docs/UserAcceptanceTesting.md](docs/UserAcceptanceTesting.md) and [docs/PerformanceTesting.md](docs/PerformanceTesting.md).

---

## Known Limitation

The campus coordinates are representative sample values, not surveyed positions of a real campus.

---

## Documentation

| Document | Purpose |
|---|---|
| [docs/UserGuide.md](docs/UserGuide.md) | How to use the app |
| [docs/TechnicalDocumentation.md](docs/TechnicalDocumentation.md) | Architecture and implementation |
| [docs/UserAcceptanceTesting.md](docs/UserAcceptanceTesting.md) | UAT cases and results |
| [docs/PerformanceTesting.md](docs/PerformanceTesting.md) | Performance validation |
| [docs/AIAssistedDevelopment.md](docs/AIAssistedDevelopment.md) | AI-use declaration |
| [docs/XcodeMigrationChecklist.md](docs/XcodeMigrationChecklist.md) | Restoring the Xcode project |
| [docs/ProjectPlan.md](docs/ProjectPlan.md), [docs/ScreenFlow.md](docs/ScreenFlow.md), [docs/DataModel.md](docs/DataModel.md) | Planning and design notes |

---

## Project Structure

```text
SE4041-Assignment02-iOS/
│
├── App/
│   └── SmartCampusNavigatorApp.swift
├── Components/
│   └── LocationCard.swift
├── Data/
│   └── SamplePlaces.swift
├── Models/
│   ├── Place.swift
│   └── FavoritePlaceEntity.swift
├── Persistence/
│   └── PersistenceController.swift
├── Theme/
│   └── AppTheme.swift
├── Views/
│   ├── HomeView.swift
│   ├── CampusMapView.swift
│   ├── PlaceDetailView.swift
│   └── SavedPlacesView.swift
├── Tests/
│   └── SmartCampusNavigatorTests.swift
├── UITests/
│   └── SmartCampusNavigatorUITests.swift
├── XcodeProject/            (copy of the sources + assets; .xcodeproj to be restored here)
│   ├── Assets.xcassets/
│   ├── ContentView.swift    (unused Xcode template file)
│   ├── SmartCampusNavigatorApp.swift
│   └── Components/ Data/ Models/ Persistence/ Theme/ Views/
├── docs/
│   ├── AIAssistedDevelopment.md
│   ├── DataModel.md
│   ├── PerformanceTesting.md
│   ├── ProjectPlan.md
│   ├── ScreenFlow.md
│   ├── TechnicalDocumentation.md
│   ├── UserAcceptanceTesting.md
│   ├── UserGuide.md
│   └── XcodeMigrationChecklist.md
└── README.md
```
