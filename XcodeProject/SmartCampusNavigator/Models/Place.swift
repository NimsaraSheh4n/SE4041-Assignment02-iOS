import Foundation
import CoreLocation

struct Place: Identifiable, Hashable {

    let id: UUID
    let name: String
    let category: String
    let description: String
    let latitude: Double
    let longitude: Double
    let imageName: String

    init(
        id: UUID = UUID(),
        name: String,
        category: String,
        description: String,
        latitude: Double,
        longitude: Double,
        imageName: String
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.imageName = imageName
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}
