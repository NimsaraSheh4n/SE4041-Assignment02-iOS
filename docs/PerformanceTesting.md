# Smart Campus Navigator - Performance and Optimization Testing

## Module
SE4041 - Mobile Application Design and Development

## Assignment
Assignment 02 - Part A

## Application
Smart Campus Navigator

## Purpose

The purpose of performance testing is to verify that the application remains responsive, stable and efficient while navigating between screens, displaying MapKit content, searching campus locations and accessing Core Data.

---

## Performance Areas

The application is assessed in the following areas (see the status of each below):

- Application launch performance
- Screen navigation responsiveness
- MapKit loading performance
- Map interaction responsiveness
- Search performance
- Core Data save and fetch performance
- Animation smoothness
- Memory usage
- CPU usage
- General application stability

---

## Result Key

- **Observed** - noted qualitatively by the developer in the iOS Simulator during the final Xcode session (no numeric measurement).
- **Not measured** - no profiling or measurement has been carried out; no result is claimed.

---

## Performance Test Cases

| Test ID | Area | Test Procedure | Expected Result | Status |
|---|---|---|---|---|
| PERF-01 | App Launch | Launch the application using the iPhone Simulator | Home screen should load without significant delay | Observed: launched successfully (no timing recorded) |
| PERF-02 | Navigation | Navigate between Home, Map, Saved Places and Place Details | Navigation should remain smooth | Observed: simulator navigation was responsive (no frame-rate measurement) |
| PERF-03 | Map Loading | Open the Campus Map screen | Map should load correctly without freezing the interface | Observed: map screen opened (no timing recorded) |
| PERF-04 | Map Interaction | Pan and zoom the campus map | Map interaction should remain responsive | Not measured |
| PERF-05 | Marker Selection | Select multiple map annotations | Location cards should appear smoothly | Not measured |
| PERF-06 | Category Filter | Switch between map categories | Map annotations should update without noticeable delay | Not measured |
| PERF-07 | Search | Search using different names and categories | Results should update immediately | Not measured |
| PERF-08 | Core Data Save | Save several locations as favourites | Saving should complete without noticeable delay | Not measured |
| PERF-09 | Core Data Fetch | Open Saved Places with stored locations | Saved locations should load quickly | Not measured |
| PERF-10 | Animation | Use favourite and map selection animations | Animations should remain smooth | Not measured |
| PERF-11 | Memory | Navigate through the application repeatedly | Memory usage should remain stable | Not measured |
| PERF-12 | Stability | Use the application continuously for several minutes | Application should not crash or become unresponsive | Not measured |
| PERF-13 | Automated tests | Run the unit and UI tests in Xcode | Tests should execute and pass | Observed: the 5 original Part A unit tests and 2 UI tests passed |

---

## Optimization Techniques

The application uses the following approaches to improve performance:

### Lazy Loading

`LazyVStack` is used when displaying campus locations so that SwiftUI creates views efficiently.

### Reusable Components

Reusable components such as `LocationCard` reduce duplicated UI code and help maintain a consistent interface.

### Filtered Data

Search and category filtering are performed on the small campus location dataset before displaying results.

### Core Data

Core Data is used for persistent favourite storage and provides efficient structured data management.

### Lightweight Map Annotations

MapKit annotations use SF Symbols and lightweight SwiftUI views instead of large image assets.

### Native SwiftUI Animations

Native SwiftUI animations and transitions are used to maintain efficient interaction performance.

---

## Xcode Performance Tools (Future Work)

The following tools could be used for future profiling. **None of them has been run yet, and no values are reported.**

- Debug Navigator
- Memory Graph
- CPU usage monitoring
- Xcode Instruments where appropriate
- SwiftUI runtime diagnostics

---

## Final Performance Status

### Observed validation (final Xcode/macOS session)

- The application built and launched successfully.
- Navigation between Home, Campus Map, Place Details and Saved Places was responsive in the iOS Simulator.
- Automated test execution succeeded (5 original Part A unit tests and 2 UI tests passed).

These are qualitative observations only.

### Not yet done (future profiling work)

- No launch times, frame rates, memory figures, CPU figures or Instruments traces have been recorded.
- Rows marked **Not measured** remain open until they are actually tested.
- Unit/UI tests added or changed after the final session have not yet been run on a Mac.
