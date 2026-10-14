import XCTest
import CoreData
@testable import SmartCampusNavigator

final class SmartCampusNavigatorTests: XCTestCase {

    // MARK: - Place Model Tests

    func testSamplePlacesAreAvailable() {

        XCTAssertFalse(
            SamplePlaces.places.isEmpty,
            "Sample places should not be empty."
        )
    }


    func testPlaceContainsCorrectValues() {

        let place = Place(
            name: "Main Library",
            category: "Library",
            description: "Campus library",
            latitude: 6.9147,
            longitude: 79.9729,
            imageName: "library"
        )

        XCTAssertEqual(
            place.name,
            "Main Library"
        )

        XCTAssertEqual(
            place.category,
            "Library"
        )

        XCTAssertEqual(
            place.latitude,
            6.9147,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            place.longitude,
            79.9729,
            accuracy: 0.0001
        )
    }


    func testPlaceCoordinateMatchesLocation() {

        let place = Place(
            name: "Test Location",
            category: "Library",
            description: "Test",
            latitude: 6.9147,
            longitude: 79.9729,
            imageName: "test"
        )

        XCTAssertEqual(
            place.coordinate.latitude,
            6.9147,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            place.coordinate.longitude,
            79.9729,
            accuracy: 0.0001
        )
    }


    // MARK: - Search Logic Test

    func testLocationSearchByCategory() {

        let searchText = "Library"

        let results = SamplePlaces.places.filter {

            $0.name.localizedCaseInsensitiveContains(
                searchText
            )
            ||
            $0.category.localizedCaseInsensitiveContains(
                searchText
            )
        }

        XCTAssertFalse(
            results.isEmpty,
            "Library search should return at least one location."
        )

        XCTAssertTrue(
            results.contains {
                $0.category == "Library"
            }
        )
    }


    // MARK: - Core Data Test

    func testFavoriteCanBeSavedToCoreData() throws {

        let persistenceController =
            PersistenceController(
                inMemory: true
            )

        let context =
            persistenceController
                .container
                .viewContext

        let favorite =
            FavoritePlaceEntity(
                context: context
            )

        favorite.id = UUID()
        favorite.name = "Main Library"
        favorite.category = "Library"
        favorite.placeDescription =
            "Campus library"

        favorite.latitude = 6.9147
        favorite.longitude = 79.9729
        favorite.imageName = "library"

        try context.save()


        let request =
            FavoritePlaceEntity.fetchRequest()

        let results =
            try context.fetch(request)


        XCTAssertEqual(
            results.count,
            1
        )

        XCTAssertEqual(
            results.first?.wrappedName,
            "Main Library"
        )
    }
}
