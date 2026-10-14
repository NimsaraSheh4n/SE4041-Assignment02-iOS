# Smart Campus Navigator - Data Model

## Overview

The application will manage campus location information and store user favourite locations.

## Place Model

Each campus location will contain the following properties:

| Property | Type | Description |
|---|---|---|
| id | UUID | Unique identifier for the location |
| name | String | Name of the campus location |
| category | String | Location category |
| description | String | Description of the location |
| latitude | Double | Map latitude |
| longitude | Double | Map longitude |
| imageName | String | Image resource name |
| isFavorite | Bool | Indicates whether the place is saved |

## Example Place

```swift
Place(
    id: UUID(),
    name: "Main Library",
    category: "Library",
    description: "Main academic library of the campus.",
    latitude: 6.9147,
    longitude: 79.9729,
    imageName: "library",
    isFavorite: false
)
