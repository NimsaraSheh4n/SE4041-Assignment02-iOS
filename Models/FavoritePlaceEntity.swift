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

extension FavoritePlaceEntity {

    static func fetchRequest() -> NSFetchRequest<FavoritePlaceEntity> {
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
