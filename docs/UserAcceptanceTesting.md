# Smart Campus Navigator - User Acceptance Testing

## Module
SE4041 - Mobile Application Design and Development

## Assignment
Assignment 02 - Part A

## Application
Smart Campus Navigator

## Purpose

The purpose of User Acceptance Testing (UAT) is to verify that the Smart Campus Navigator application meets the expected user requirements and provides a clear, usable and reliable experience.

---

## Test Environment

- Platform: iOS
- Framework: SwiftUI
- Map Framework: MapKit
- Persistence: Core Data
- Test Device: iPhone Simulator
- Development Environment: Xcode

---

## Result Key

- **PASS** - checked by the developer in the iOS Simulator during the final Xcode session.
- **Not recorded** - not formally checked and recorded; no result is claimed.

---

## UAT Test Cases

| Test ID | Feature | Test Procedure | Expected Result | Status |
|---|---|---|---|---|
| UAT-01 | App Launch | Launch the application | Home screen should load successfully | PASS |
| UAT-02 | Home Screen | View the Home screen | App title, search, quick actions and campus locations should appear | PASS |
| UAT-03 | Search | Search for "Library" | Library locations should be displayed | PASS (basic search) |
| UAT-04 | Search by Category | Search for "Cafeteria" | Cafeteria locations should appear | Not recorded |
| UAT-05 | Campus Map | Tap Campus Map | Interactive campus map should open | PASS (navigation) |
| UAT-06 | Map Marker | Tap a location marker | Location preview card should appear | Not recorded |
| UAT-07 | Map Category Filter | Select a category | Only locations from that category should remain visible | Not recorded |
| UAT-08 | Place Details | Open a location | Place Details screen should open | PASS (navigation) |
| UAT-09 | Save Favourite | Tap Save to Favourites | Location should be stored in Core Data | Not recorded |
| UAT-10 | Saved Places | Open Saved Places | Saved Places screen should open | PASS (navigation) |
| UAT-11 | Persistent Storage | Close and reopen the application | Saved favourite should still be available | Not recorded |
| UAT-12 | Remove Favourite | Remove a saved location | Location should disappear from Saved Places | Not recorded |
| UAT-13 | Swipe Delete | Swipe to delete a saved place | Saved place should be deleted successfully | Not recorded |
| UAT-14 | Dark Mode | Enable iOS Dark Mode | Interface should remain readable and visually consistent | Not recorded |
| UAT-15 | Dynamic Type | Increase system text size | Text should scale without breaking the layout | Not recorded |
| UAT-16 | Accessibility | Use VoiceOver to navigate key controls | Controls should provide meaningful accessibility labels | Not recorded |

> The app was launched and navigated through Home, Campus Map, Place Details and Saved Places in the simulator. Accessibility changes made after that session (scalable icon sizes and accessibility identifiers) have not yet been re-checked in the simulator.

---

## User Evaluation Criteria

Test users will evaluate the application based on:

- Ease of navigation
- Clarity of information
- Search usability
- Map usability
- Visual consistency
- Favourite-saving workflow
- Readability
- Accessibility
- Overall user experience

---

## Participant Feedback

No external participant feedback has been collected. The questions below are a template for any future user evaluation.

### Feedback Questions

1. Was the application easy to navigate?
2. Was it easy to locate campus facilities?
3. Was the map interaction understandable?
4. Was the favourite feature easy to use?
5. Was the visual design clear and consistent?
6. Were text and controls easy to read?
7. What improvements would you recommend?

---

## Final Testing Status

> Formal external-user UAT was not conducted during the final development session. Simulator-based developer acceptance checks were completed.

The application built and ran in Xcode on macOS, and the developer verified launch, the Home screen, basic search and navigation to the Campus Map, Place Details and Saved Places in the iOS Simulator.

Rows marked **Not recorded** have no result claimed and should be updated only after they are actually tested.
