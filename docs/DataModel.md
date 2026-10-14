# Smart Campus Navigator - Data Model

## Overview

The Smart Campus Navigator uses two main data structures:

1. `Place` - represents a campus location used throughout the application.
2. `FavoritePlaceEntity` - stores favourite locations persistently using Core Data.

---

## Place Model

The `Place` model represents a campus facility or location.

### Properties

| Property | Type | Description |
|---|---|---|
| id | UUID | Unique identifier for the location |
| name | String | Name of the campus location |
| category | String | Category of the location |
| description | String | Description of the location |
| latitude | Double | Geographic latitude |
| longitude | Double | Geographic longitude |
| imageName | String | Image or asset identifier |

The model also provides a computed `coordinate` property using `CLLocationCoordinate2D`.

### Coordinate

The coordinate is generated from:

- Latitude
- Longitude

This coordinate is used by MapKit to display locations on the campus map.

---

## Favourite Persistence Model

Favourite locations are stored separately using Core Data through `FavoritePlaceEntity`.

### Properties

| Property | Type | Description |
|---|---|---|
| id | UUID? | Identifier matching the original Place |
| name | String? | Saved place name |
| category | String? | Saved place category |
| placeDescription | String? | Saved place description |
| latitude | Double | Saved geographic latitude |
| longitude | Double | Saved geographic longitude |
| imageName | String? | Saved image identifier |

---

## Favourite State

The `Place` model does not contain an `isFavorite` property.

Favourite status is determined by checking whether a matching `FavoritePlaceEntity` exists in Core Data.

This keeps the main campus location model separate from persistent user-specific data.

---

## Data Flow

### Campus Location Data

```text
SamplePlaces
    ↓
Place
    ↓
HomeView
    ↓
CampusMapView / PlaceDetailView
