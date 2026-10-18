import XCTest

final class SmartCampusNavigatorUITests: XCTestCase {

    private var app: XCUIApplication!


    override func setUpWithError() throws {

        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }


    override func tearDownWithError() throws {

        app = nil
    }


    // MARK: - App Launch Test

    func testHomeScreenLoads() {

        XCTAssertTrue(
            app.staticTexts[
                "Smart Campus"
            ].exists
        )

        XCTAssertTrue(
            app.staticTexts[
                "Find your way around campus"
            ].exists
        )
    }


    // MARK: - Search Test

    func testSearchFieldExists() {

        let searchField =
            app.textFields[
                "Search locations"
            ]

        XCTAssertTrue(
            searchField.exists
        )
    }


    // MARK: - Campus Map Navigation

    func testOpenCampusMap() {

        let mapButton =
            app.buttons[
                "Campus Map"
            ]

        XCTAssertTrue(
            mapButton.exists
        )

        mapButton.tap()

        XCTAssertTrue(
            app.navigationBars[
                "Campus Map"
            ].exists
        )
    }


    // MARK: - Saved Places Navigation

    func testOpenSavedPlaces() {

        let savedPlacesButton =
            app.buttons[
                "Saved Places"
            ]

        XCTAssertTrue(
            savedPlacesButton.exists
        )

        savedPlacesButton.tap()

        XCTAssertTrue(
            app.navigationBars[
                "Saved Places"
            ].exists
        )
    }


    // MARK: - Location Details

    func testOpenLocationDetails() {

        let library =
            app.staticTexts[
                "Main Library"
            ]

        XCTAssertTrue(
            library.exists
        )

        library.tap()

        XCTAssertTrue(
            app.navigationBars[
                "Place Details"
            ].exists
        )
    }
}
