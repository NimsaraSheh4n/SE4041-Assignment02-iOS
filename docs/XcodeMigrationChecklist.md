# Smart Campus Navigator - Xcode Migration Checklist

## Purpose

The Swift sources, tests and assets in this repository were built, run and tested successfully in Xcode on macOS. However, the `SmartCampusNavigator.xcodeproj` file is **not currently committed** to `XcodeProject/`. This checklist describes the final Mac step needed to restore it and verify the application and tests.

---

## 1. Requirements

- A Mac with Xcode installed (iOS 17 SDK or later, because the app uses the newer SwiftUI MapKit APIs)
- Git
- Access to this GitHub repository

---

## 2. Clone the Repository

```bash
git clone https://github.com/NimsaraSheh4n/SE4041-Assignment02-iOS.git
cd SE4041-Assignment02-iOS
```

---

## 3. Restore the Xcode Project

**Option A - copy the original project (preferred).** If you still have the working `SmartCampusNavigator.xcodeproj` from the Mac validation session, copy it into `XcodeProject/`, so the final path is:

```text
XcodeProject/SmartCampusNavigator.xcodeproj
```

Do not copy `xcuserdata/` or `DerivedData/`.

**Option B - recreate it.**

1. In Xcode choose **File > New > Project > iOS > App**.
2. Product Name: `SmartCampusNavigator`, Interface: **SwiftUI**, Language: **Swift**. Save inside `XcodeProject/`.
3. Delete the template `ContentView.swift`.
4. Add the source folders to the app target: `App/` (or `XcodeProject/SmartCampusNavigatorApp.swift`, not both), `Views/`, `Components/`, `Models/`, `Data/`, `Persistence/`, `Theme/`.
5. Make sure `Assets.xcassets` is in the app target.
6. Add a **Unit Testing Bundle** target and add `Tests/SmartCampusNavigatorTests.swift`.
7. Add a **UI Testing Bundle** target and add `UITests/SmartCampusNavigatorUITests.swift`.
8. Add each Swift file to only one copy of the sources, because the top-level folders and `XcodeProject/` contain identical files; referencing both causes duplicate-symbol errors.

---

## 4. Verify the Project

1. Open `SmartCampusNavigator.xcodeproj`.
2. Check **Build Phases > Compile Sources** for the app target contains every source file exactly once.
3. Check the unit and UI test targets contain the test files.
4. Select an iPhone Simulator running iOS 17 or later.

---

## 5. Build and Run

Press **Cmd + R**. Confirm the app launches and that Home, Campus Map, Place Details and Saved Places can be opened.

---

## 6. Run the Tests

Press **Cmd + U**, or run:

```bash
xcodebuild test \
  -project XcodeProject/SmartCampusNavigator.xcodeproj \
  -scheme SmartCampusNavigator \
  -destination 'platform=iOS Simulator,name=<installed simulator name>'
```

The following were added or changed after the last successful Xcode run and **must be run to confirm they pass**:

- `testSamplePlaceIDsAreUnique`
- `testSamplePlaceIDsAreStable`
- `testFavoriteCanBeDeletedFromCoreData`
- `testFavoriteConvertsBackToPlace`
- the UI tests updated to use accessibility identifiers

Also check visually that icons and the Place Details header still look right at the default text size and at a larger Dynamic Type size.

---

## 7. Update the Documentation with Real Results

Record only what you actually observe in `docs/UserAcceptanceTesting.md`, `docs/PerformanceTesting.md` and the Testing Status table in `README.md`. Do not add estimated values.

---

## 8. Commit the Project

Confirm `.gitignore` excludes `xcuserdata/` and `DerivedData/`, then commit `XcodeProject/SmartCampusNavigator.xcodeproj` (including `project.pbxproj`) and push to `main`.
