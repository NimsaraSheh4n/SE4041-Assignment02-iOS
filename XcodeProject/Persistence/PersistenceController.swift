import Foundation
import CoreData

struct PersistenceController {

    static let shared = PersistenceController()

    let container: NSPersistentContainer


    // MARK: - Initializer

    init(inMemory: Bool = false) {

        let model = Self.createModel()

        container = NSPersistentContainer(
            name: "SmartCampusNavigator",
            managedObjectModel: model
        )


        // Use an in-memory database for unit testing
        if inMemory {

            container
                .persistentStoreDescriptions
                .first?
                .type = NSInMemoryStoreType
        }


        container.loadPersistentStores { _, error in

            if let error = error as NSError? {

                fatalError(
                    "Core Data error: \(error), \(error.userInfo)"
                )
            }
        }


        container
            .viewContext
            .automaticallyMergesChangesFromParent = true

        container
            .viewContext
            .mergePolicy =
                NSMergeByPropertyObjectTrumpMergePolicy
    }


    // MARK: - Managed Object Model

    private static func createModel()
        -> NSManagedObjectModel {

        let model = NSManagedObjectModel()


        // MARK: Entity

        let entity = NSEntityDescription()

        entity.name = "FavoritePlaceEntity"

        entity.managedObjectClassName =
            NSStringFromClass(
                FavoritePlaceEntity.self
            )


        // MARK: ID

        let id =
            NSAttributeDescription()

        id.name = "id"

        id.attributeType =
            .UUIDAttributeType

        id.isOptional = true


        // MARK: Name

        let name =
            NSAttributeDescription()

        name.name = "name"

        name.attributeType =
            .stringAttributeType

        name.isOptional = true


        // MARK: Category

        let category =
            NSAttributeDescription()

        category.name = "category"

        category.attributeType =
            .stringAttributeType

        category.isOptional = true


        // MARK: Description

        let placeDescription =
            NSAttributeDescription()

        placeDescription.name =
            "placeDescription"

        placeDescription.attributeType =
            .stringAttributeType

        placeDescription.isOptional = true


        // MARK: Latitude

        let latitude =
            NSAttributeDescription()

        latitude.name = "latitude"

        latitude.attributeType =
            .doubleAttributeType

        latitude.defaultValue = 0.0


        // MARK: Longitude

        let longitude =
            NSAttributeDescription()

        longitude.name = "longitude"

        longitude.attributeType =
            .doubleAttributeType

        longitude.defaultValue = 0.0


        // MARK: Image Name

        let imageName =
            NSAttributeDescription()

        imageName.name = "imageName"

        imageName.attributeType =
            .stringAttributeType

        imageName.isOptional = true


        // MARK: Add Properties

        entity.properties = [
            id,
            name,
            category,
            placeDescription,
            latitude,
            longitude,
            imageName
        ]


        model.entities = [
            entity
        ]


        return model
    }
}
