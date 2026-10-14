# Smart Campus Navigator - Screen Flow

## Main Navigation Structure

The application will use SwiftUI NavigationStack for navigation between screens.

Home
│
├── Campus Map
│   └── Place Details
│
├── Saved Places
│   └── Place Details
│
└── Search Results
    └── Place Details


## 1. Home Screen

### Purpose
Provide quick access to important campus locations and major app features.

### UI Components
- App title and welcome message
- Search bar
- Quick access categories
- Featured campus locations
- Recently viewed locations
- Navigation buttons

### Navigation
Home → Campus Map  
Home → Saved Places  
Home → Place Details


## 2. Campus Map Screen

### Purpose
Allow users to explore important campus locations using an interactive map.

### UI Components
- MapKit map
- Custom location annotations
- Search field
- Location category filter
- Location preview card
- Current map region controls

### Interaction
- Tap a map marker to select a location
- Tap the location card to open Place Details
- Drag and zoom the map


## 3. Saved Places Screen

### Purpose
Display locations saved by the user.

### UI Components
- Saved location list
- Custom location cards
- Empty-state message
- Remove favourite button

### Data
Saved locations will be stored using Core Data.

### Navigation
Saved Places → Place Details


## 4. Place Details Screen

### Purpose
Display detailed information about a selected campus location.

### UI Components
- Location image
- Location name
- Category
- Description
- Map preview
- Favourite button
- Location information

### Interaction
- Save or remove location from favourites
- View location on the campus map


## User Flow

1. User opens the application.
2. Home screen is displayed.
3. User searches for or selects a campus location.
4. User views the location on the map.
5. User opens the Place Details screen.
6. User may save the location as a favourite.
7. Saved locations remain available through Core Data.


## Advanced UI Features

- Animated screen transitions
- Custom location cards
- Favourite button animation
- Gesture-based map interactions
- Adaptive layouts
- Dark Mode support
- Dynamic Type support


## Navigation Technology

SwiftUI NavigationStack will be used for screen navigation.
