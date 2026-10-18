# AI-Assisted Development Documentation

## Module

SE4041 - Mobile Application Design and Development

## Assignment

Assignment 02 - Part A

## Project

Smart Campus Navigator

---

## AI Tools Used

Both **ChatGPT** and **Antigravity IDE** were used as development-support tools during this project, for:

- Planning
- Repository review
- Debugging guidance
- Test preparation
- Documentation refinement
- Submission preparation

The final project structure, implementation decisions, testing, documentation and submitted work were reviewed and managed by the student.

**Final application execution and test validation were performed manually in Xcode on macOS.** Neither AI tool ran the application or the tests.

---

## Areas Where AI Was Used

AI assistance was used for:

- Project concept planning
- Requirement analysis
- SwiftUI project structure planning
- Swift code preparation
- MapKit integration guidance
- Core Data persistence planning
- Navigation structure
- Custom SwiftUI components
- Accessibility improvements
- Dark Mode and Dynamic Type considerations
- Debugging assistance
- Code review
- Unit test preparation
- UI test preparation
- User Acceptance Testing and performance testing documentation templates
- README and technical documentation

---

## Example Development Interactions

### Interaction 1 - Application Concept

**Prompt Summary:**  
Requested guidance for developing an iOS assignment using Windows without permanent access to a Mac.

**AI Assistance:**  
Suggested separating development into Windows-based planning/source preparation and final Xcode build/testing on macOS.

**Student Action:**  
Reviewed the assignment requirements and selected Smart Campus Navigator as the application concept.

---

### Interaction 2 - Application Architecture

**Prompt Summary:**  
Requested a suitable SwiftUI project structure.

**AI Assistance:**  
Suggested separating the project into:

- App
- Models
- Data
- Views
- Components
- Persistence
- Theme
- Tests
- UI Tests
- Documentation

**Student Action:**  
Created and organized the GitHub repository using this structure.

---

### Interaction 3 - MapKit Integration

**Prompt Summary:**  
Requested guidance for implementing an interactive campus map.

**AI Assistance:**  
Provided guidance for MapKit annotations, location selection, category filters and navigation to place details.

**Student Action:**  
Reviewed and added the MapKit-related Swift source code to the project repository.

---

### Interaction 4 - Core Data Persistence

**Prompt Summary:**  
Requested a method to persist favourite campus locations.

**AI Assistance:**  
Suggested using Core Data and provided a persistence architecture for favourite locations.

**Student Action:**  
Added Core Data entity and persistence controller source files and connected them to Saved Places and Place Details.

---

### Interaction 5 - Accessibility and UI

**Prompt Summary:**  
Requested improvements to UI quality and accessibility.

**AI Assistance:**  
Suggested reusable ViewModifiers, system colours, Dynamic Type-compatible fonts and VoiceOver labels.

**Student Action:**  
Applied and reviewed these changes across the application UI.

---

### Interaction 6 - Testing

**Prompt Summary:**  
Requested testing preparation for the application.

**AI Assistance:**  
Provided example unit tests, UI tests, UAT cases and performance test planning.

**Student Action:**  
Added test source files and testing documentation. Build and test validation was performed manually in Xcode on macOS (see Validation and Review).

---

## Validation and Review

AI-generated suggestions were not treated as verified output automatically. The final build and test validation was performed manually by the student in Xcode on macOS:

- The application built and ran successfully.
- The 5 Part A unit tests passed.
- 2 UI tests passed.
- Core flows (Home, Campus Map, Place Details, Saved Places) were checked manually in the iOS Simulator.

No external user testing or Instruments profiling was carried out.

### Documentation and submission preparation

After the Xcode validation, repository review, documentation refinement and submission preparation were carried out with AI assistance (Antigravity IDE and ChatGPT). Remaining items that have not been run in Xcode are marked as such in the documentation.

---

## Limitations

Part of the source and documentation was prepared in a Windows environment where Xcode, SwiftUI runtime testing and the iOS Simulator were not available. Anything not yet run in Xcode is marked as such in the documentation.

---

## Academic Use Statement

ChatGPT and Antigravity IDE were used as development support tools for planning, repository review, debugging guidance, test preparation, documentation refinement and submission preparation.

The student remains responsible for understanding, reviewing, testing and presenting the final submitted work.
