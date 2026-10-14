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

The application will be evaluated in the following areas:

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

## Performance Test Cases

| Test ID | Area | Test Procedure | Expected Result | Status |
|---|---|---|---|---|
| PERF-01 | App Launch | Launch the application using the iPhone Simulator | Home screen should load without significant delay | Pending |
| PERF-02 | Navigation | Navigate repeatedly between Home, Map, Saved Places and Place Details | Navigation should remain smooth | Pending |
| PERF-03 | Map Loading | Open the Campus Map screen | Map should load correctly without freezing the interface | Pending |
| PERF-04 | Map Interaction | Pan and zoom the campus map | Map interaction should remain responsive | Pending |
| PERF-05 | Marker Selection | Select multiple map annotations | Location cards should appear smoothly | Pending |
| PERF-06 | Category Filter | Switch between map categories | Map annotations should update without noticeable delay | Pending |
| PERF-07 | Search | Search using different names and categories | Results should update immediately | Pending |
| PERF-08 | Core Data Save | Save several locations as favourites | Saving should complete without noticeable delay | Pending |
| PERF-09 | Core Data Fetch | Open Saved Places with stored locations | Saved locations should load quickly | Pending |
| PERF-10 | Animation | Use favourite and map selection animations | Animations should remain smooth | Pending |
| PERF-11 | Memory | Navigate through the application repeatedly | Memory usage should remain stable | Pending |
| PERF-12 | Stability | Use the application continuously for several minutes | Application should not crash or become unresponsive | Pending |

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

## Xcode Performance Tools

The following tools will be used when the project is available in Xcode:

- Debug Navigator
- Memory Graph
- CPU usage monitoring
- Xcode Instruments where appropriate
- SwiftUI runtime diagnostics

---

## Final Performance Status

Performance testing will be completed using Xcode and the iPhone Simulator.

All results will remain marked as **Pending** until the application is actually executed and evaluated.
