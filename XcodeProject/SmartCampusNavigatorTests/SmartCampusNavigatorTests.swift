import XCTest
import CoreData
import CoreLocation
@testable import SmartCampusNavigator

final class SmartCampusNavigatorTests: XCTestCase {

    func testSamplePlacesAreAvailable() {
        XCTAssertFalse(
            SamplePlaces.places.isEmpty,
            "Sample places should not be empty."
        )
    }

    func testPlaceContainsCorrectValues() {
        let id = UUID()

        let place = Place(
            id: id,
            name: "Main Library",
            category: "Library",
            description: "Campus library",
            latitude: 6.9271,
            longitude: 79.8612,
            imageName: "library"
        )

        XCTAssertEqual(place.id, id)
        XCTAssertEqual(place.name, "Main Library")
        XCTAssertEqual(place.category, "Library")
        XCTAssertEqual(place.description, "Campus library")
        XCTAssertEqual(place.latitude, 6.9271)
        XCTAssertEqual(place.longitude, 79.8612)
        XCTAssertEqual(place.imageName, "library")
    }

    func testPlaceCoordinateMatchesLocation() {
        let place = Place(
            name: "Main Library",
            category: "Library",
            description: "Campus library",
            latitude: 6.9271,
            longitude: 79.8612,
            imageName: "library"
        )

        XCTAssertEqual(
            place.coordinate.latitude,
            place.latitude,
            accuracy: 0.000001
        )

        XCTAssertEqual(
            place.coordinate.longitude,
            place.longitude,
            accuracy: 0.000001
        )
    }

    func testLocationSearchByCategory() {
        guard let firstPlace = SamplePlaces.places.first else {
            XCTFail("Sample places should contain at least one place.")
            return
        }

        let category = firstPlace.category

        let results = SamplePlaces.places.filter {
            $0.category.localizedCaseInsensitiveContains(category)
        }

        XCTAssertFalse(results.isEmpty)

        XCTAssertTrue(
            results.allSatisfy {
                $0.category.localizedCaseInsensitiveContains(category)
            }
        )
    }

    func testFavoriteCanBeSavedToCoreData() throws {
        let persistenceController = PersistenceController(inMemory: true)
        let context = persistenceController.container.viewContext

        let favorite = NSEntityDescription.insertNewObject(
            forEntityName: "FavoritePlaceEntity",
            into: context
        ) as! FavoritePlaceEntity

        favorite.id = UUID()
        favorite.name = "Main Library"
        favorite.category = "Library"
        favorite.placeDescription = "Campus library"
        favorite.latitude = 6.9271
        favorite.longitude = 79.8612
        favorite.imageName = "library"

        try context.save()

        let request: NSFetchRequest<FavoritePlaceEntity> =
            FavoritePlaceEntity.fetchRequest()

        let results = try context.fetch(request)

        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results.first?.wrappedName, "Main Library")
    }
}
