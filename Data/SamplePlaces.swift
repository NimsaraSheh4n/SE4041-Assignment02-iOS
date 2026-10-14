import Foundation

enum SamplePlaces {

    static let places: [Place] = [

        Place(
            id: UUID(
                uuidString:
                    "11111111-1111-1111-1111-111111111111"
            )!,
            name: "Main Library",
            category: "Library",
            description:
                "The main campus library provides study spaces, academic resources and student learning facilities.",
            latitude: 6.9147,
            longitude: 79.9729,
            imageName: "library"
        ),

        Place(
            id: UUID(
                uuidString:
                    "22222222-2222-2222-2222-222222222222"
            )!,
            name: "Computing Faculty",
            category: "Lecture Hall",
            description:
                "Academic building containing lecture rooms and learning spaces for computing students.",
            latitude: 6.9150,
            longitude: 79.9732,
            imageName: "computing"
        ),

        Place(
            id: UUID(
                uuidString:
                    "33333333-3333-3333-3333-333333333333"
            )!,
            name: "Student Cafeteria",
            category: "Cafeteria",
            description:
                "A campus dining area where students can purchase meals, snacks and refreshments.",
            latitude: 6.9144,
            longitude: 79.9735,
            imageName: "cafeteria"
        ),

        Place(
            id: UUID(
                uuidString:
                    "44444444-4444-4444-4444-444444444444"
            )!,
            name: "Administration Building",
            category: "Administration",
            description:
                "Provides administrative services and support for students and university staff.",
            latitude: 6.9153,
            longitude: 79.9726,
            imageName: "administration"
        ),

        Place(
            id: UUID(
                uuidString:
                    "55555555-5555-5555-5555-555555555555"
            )!,
            name: "Engineering Laboratory",
            category: "Laboratory",
            description:
                "Laboratory facilities used for practical sessions, experiments and technical learning activities.",
            latitude: 6.9149,
            longitude: 79.9738,
            imageName: "laboratory"
        ),

        Place(
            id: UUID(
                uuidString:
                    "66666666-6666-6666-6666-666666666666"
            )!,
            name: "Student Services Centre",
            category: "Student Services",
            description:
                "Provides student support, academic assistance and general campus services.",
            latitude: 6.9142,
            longitude: 79.9728,
            imageName: "student-services"
        )
    ]
}
