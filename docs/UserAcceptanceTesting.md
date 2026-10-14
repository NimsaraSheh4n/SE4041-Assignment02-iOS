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

## UAT Test Cases

| Test ID | Feature | Test Procedure | Expected Result | Status |
|---|---|---|---|---|
| UAT-01 | App Launch | Launch the application | Home screen should load successfully | Pending |
| UAT-02 | Home Screen | View the Home screen | App title, search, quick actions and campus locations should appear | Pending |
| UAT-03 | Search | Search for "Library" | Library locations should be displayed | Pending |
| UAT-04 | Search by Category | Search for "Cafeteria" | Cafeteria locations should appear | Pending |
| UAT-05 | Campus Map | Tap Campus Map | Interactive campus map should open | Pending |
| UAT-06 | Map Marker | Tap a location marker | Location preview card should appear | Pending |
| UAT-07 | Map Category Filter | Select a category | Only locations from that category should remain visible | Pending |
| UAT-08 | Place Details | Open a location | Place Details screen should display information and map preview | Pending |
| UAT-09 | Save Favourite | Tap Save to Favourites | Location should be stored in Core Data | Pending |
| UAT-10 | Saved Places | Open Saved Places | Previously saved location should appear | Pending |
| UAT-11 | Persistent Storage | Close and reopen the application | Saved favourite should still be available | Pending |
| UAT-12 | Remove Favourite | Remove a saved location | Location should disappear from Saved Places | Pending |
| UAT-13 | Swipe Delete | Swipe to delete a saved place | Saved place should be deleted successfully | Pending |
| UAT-14 | Dark Mode | Enable iOS Dark Mode | Interface should remain readable and visually consistent | Pending |
| UAT-15 | Dynamic Type | Increase system text size | Text should scale without breaking the layout | Pending |
| UAT-16 | Accessibility | Use VoiceOver to navigate key controls | Controls should provide meaningful accessibility labels | Pending |

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

User feedback will be recorded after testing on the final iOS Simulator build.

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

UAT will be completed after the application is built and tested using Xcode and the iPhone Simulator.

The final results will be updated from **Pending** to **Pass** or **Fail** after testing.
