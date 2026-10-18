# Smart Campus Navigator - Technical Documentation

## Overview

Smart Campus Navigator is a SwiftUI iOS app that combines MapKit and Core Data. Campus locations are bundled in code; only the user's favourites are persisted.

## SwiftUI Architecture

The app is organised by responsibility:

| Folder | Responsibility |
|---|---|
| `App/` | App entry point (`SmartCampusNavigatorApp`) |
| `Views/` | Screens: `HomeView`, `CampusMapView`, `PlaceDetailView`, `SavedPlacesView` |
| `Components/` | Reusable UI (`LocationCard`) |
| `Models/` | `Place` (value type) and `FavoritePlaceEntity` (Core Data object) |
| `Data/` | `SamplePlaces` (bundled campus data) |
| `Persistence/` | `PersistenceController` (Core Data stack) |
| `Theme/` | `AppTheme` and custom view modifiers |
| `Tests/`, `UITests/` | XCTest and XCUITest sources |

Views use `@State` for local UI state, `@Environment(\.managedObjectContext)` for Core Data access and `@FetchRequest` for the saved places list.

## NavigationStack

`HomeView` owns the single `NavigationStack`. Navigation uses `NavigationLink` with destination views:

```text
HomeView (NavigationStack root)
├── CampusMapView ── PlaceDetailView
├── SavedPlacesView ── PlaceDetailView
└── PlaceDetailView
```

`CampusMapView`, `SavedPlacesView` and `PlaceDetailView` set their own navigation titles.

## Place Model

`Place` (`Models/Place.swift`) is an `Identifiable, Hashable` struct with `id`, `name`, `category`, `description`, `latitude`, `longitude` and `imageName`, plus a computed `coordinate` (`CLLocationCoordinate2D`). The `id` can be supplied so that it stays the same between launches.

## SamplePlaces Data

`SamplePlaces.places` contains six places (Main Library, Computing Faculty, Student Cafeteria, Administration Building, Engineering Laboratory, Student Services Centre). Each has a fixed, hard-coded UUID. Stable IDs matter because favourites are matched to places by `id`.

## MapKit Integration

- **Campus Map:** `Map(position:)` with a `MapCameraPosition` region centred on the sample campus. Each place is an `Annotation` containing a tappable, category-icon marker. `MapCompass` and `MapScaleView` are shown.
- **Filtering:** a category bar sets `selectedCategory`; `filteredPlaces` drives the annotations.
- **Selection:** tapping a marker sets `selectedPlace` with a spring animation and shows a preview card with a link to Place Details.
- **Place Details:** a non-interactive `Map` with a `Marker` at the place's coordinate.

MapKit APIs used require iOS 17 or later.

## Core Data Persistence

### FavoritePlaceEntity

`FavoritePlaceEntity` is an `NSManagedObject` (`@objc(FavoritePlaceEntity)`) with `id`, `name`, `category`, `placeDescription`, `latitude`, `longitude` and `imageName`. Helpers:

- `fetchRequest()` for `FavoritePlaceEntity`
- `wrappedName`, `wrappedCategory`, `wrappedDescription`, `wrappedImageName` for non-optional access
- `asPlace` to convert back into a `Place`

### PersistenceController

`PersistenceController` builds the Core Data model **programmatically** (an `NSManagedObjectModel` with one entity), so there is no `.xcdatamodeld` file. It creates an `NSPersistentContainer` named `SmartCampusNavigator`, offers an `inMemory:` option for unit tests, and sets the view context to merge changes automatically with a property-trump merge policy. `PersistenceController.shared` is injected into the SwiftUI environment in `SmartCampusNavigatorApp`.

### Favourite flow

- **Save:** `PlaceDetailView` creates a `FavoritePlaceEntity` using the place's `id` and saves the context.
- **Check/remove:** it fetches with the predicate `id == %@`, deletes matches and saves.
- **Delete from list:** `SavedPlacesView` deletes the selected objects via `onDelete` and saves.

## AppTheme

`AppTheme` (`Theme/AppTheme.swift`) holds shared constants: corner radii, padding, section spacing, accent colour and card background (a system colour).

## Reusable Components and Modifiers

- `LocationCard` - a location row with icon, name, category, description and chevron; combined into one VoiceOver element.
- `QuickActionCard` - the Home quick-access tile.
- `CampusCardModifier` / `.campusCardStyle()` - padded rounded card with a subtle border.
- `PrimaryActionButtonModifier` / `.primaryActionStyle()` - the filled call-to-action style.

## Accessibility

- VoiceOver labels and hints on cards, markers, category buttons and close/clear buttons.
- Icon sizes use `@ScaledMetric` so they follow Dynamic Type.
- `accessibilityIdentifier` values are used by the UI tests, for example `searchField`, `homeTitle`, `quickActionCampusMap`, `quickActionSavedPlaces`, `placeCard_<UUID>`, `favouriteButton`, `categoryFilter_<name>`, `savedPlacesList`.

## Test Structure

**Unit tests** (`Tests/SmartCampusNavigatorTests.swift`, `@testable import SmartCampusNavigator`):

- Sample data is available
- `Place` values and coordinate
- Search filtering logic
- Saving a favourite to an in-memory Core Data store
- Unique and stable sample-place IDs (added after the last Xcode run)
- Deleting a favourite and converting it back to a `Place` (added after the last Xcode run)

**UI tests** (`UITests/SmartCampusNavigatorUITests.swift`): Home loads, search field exists, opening Campus Map, opening Saved Places and opening Place Details, located using accessibility identifiers.

The 5 original unit tests and 2 UI tests passed in the final Xcode session. Tests added or changed afterwards have not yet been run on a Mac.

## Repository Note

The Swift sources exist in the top-level folders and in `XcodeProject/`. The `SmartCampusNavigator.xcodeproj` file must be restored into `XcodeProject/` (see `XcodeMigrationChecklist.md`). `XcodeProject/ContentView.swift` is an unused template file.

## Known Limitations

- **Representative campus coordinates:** the place coordinates are sample values, not surveyed positions of a real campus.
- Campus data is static and bundled in code.
- No routing or user-location features.
- The category list on the map is fixed and does not include "Recreation" or "Parking", although icons for them are defined.
