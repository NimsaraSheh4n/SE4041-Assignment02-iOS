import Foundation
import CoreData

@objc(FavoritePlaceEntity)
public class FavoritePlaceEntity: NSManagedObject {

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var category: String?
    @NSManaged public var placeDescription: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var imageName: String?
}


// MARK: - Fetch Request and Safe Values

extension FavoritePlaceEntity {

    static func fetchRequest()
        -> NSFetchRequest<FavoritePlaceEntity> {

        NSFetchRequest<FavoritePlaceEntity>(
            entityName: "FavoritePlaceEntity"
        )
    }


    var wrappedName: String {
        name ?? "Unknown Place"
    }


    var wrappedCategory: String {
        category ?? "Unknown"
    }


    var wrappedDescription: String {
        placeDescription ?? ""
    }


    var wrappedImageName: String {
        imageName ?? ""
    }
}


// MARK: - Convert Core Data Entity to Place

extension FavoritePlaceEntity {

    var asPlace: Place {

        Place(
            id: id ?? UUID(),
            name: wrappedName,
            category: wrappedCategory,
            description: wrappedDescription,
            latitude: latitude,
            longitude: longitude,
            imageName: wrappedImageName
        )
    }
}
