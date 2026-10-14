import CoreData

struct PersistenceController {

    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {

        let model = Self.createModel()

        container = NSPersistentContainer(
            name: "SmartCampusNavigator",
            managedObjectModel: model
        )

        if inMemory {
            container.persistentStoreDescriptions.first?.url =
                URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in

            if let error = error as NSError? {
                fatalError(
                    "Core Data error: \(error), \(error.userInfo)"
                )
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
    }


    private static func createModel() -> NSManagedObjectModel {

        let model = NSManagedObjectModel()

        let entity = NSEntityDescription()
        entity.name = "FavoritePlaceEntity"
        entity.managedObjectClassName =
            NSStringFromClass(FavoritePlaceEntity.self)


        let id = NSAttributeDescription()
        id.name = "id"
        id.attributeType = .UUIDAttributeType
        id.isOptional = true


        let name = NSAttributeDescription()
        name.name = "name"
        name.attributeType = .stringAttributeType
        name.isOptional = true


        let category = NSAttributeDescription()
        category.name = "category"
        category.attributeType = .stringAttributeType
        category.isOptional = true


        let placeDescription = NSAttributeDescription()
        placeDescription.name = "placeDescription"
        placeDescription.attributeType = .stringAttributeType
        placeDescription.isOptional = true


        let latitude = NSAttributeDescription()
        latitude.name = "latitude"
        latitude.attributeType = .doubleAttributeType
        latitude.defaultValue = 0.0


        let longitude = NSAttributeDescription()
        longitude.name = "longitude"
        longitude.attributeType = .doubleAttributeType
        longitude.defaultValue = 0.0


        let imageName = NSAttributeDescription()
        imageName.name = "imageName"
        imageName.attributeType = .stringAttributeType
        imageName.isOptional = true


        entity.properties = [
            id,
            name,
            category,
            placeDescription,
            latitude,
            longitude,
            imageName
        ]

        model.entities = [entity]

        return model
    }
}
