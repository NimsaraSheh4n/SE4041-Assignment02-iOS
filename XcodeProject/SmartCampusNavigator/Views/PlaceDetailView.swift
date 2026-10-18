import SwiftUI
import MapKit
import CoreData

struct PlaceDetailView: View {

    let place: Place

    @Environment(\.managedObjectContext)
    private var viewContext

    @State private var isFavorite = false


    private var mapRegion: MKCoordinateRegion {

        MKCoordinateRegion(
            center: place.coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.002,
                longitudeDelta: 0.002
            )
        )
    }


    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 24
            ) {

                // MARK: - Header

                ZStack {

                    RoundedRectangle(
                        cornerRadius: 24
                    )
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.blue.opacity(0.85),
                                Color.indigo.opacity(0.75)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 220)


                    VStack(spacing: 16) {

                        Image(
                            systemName: categoryIcon
                        )
                        .font(
                            .system(size: 52)
                        )
                        .foregroundStyle(.white)


                        Text(place.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(
                                .center
                            )


                        Text(place.category)
                            .font(.subheadline)
                            .foregroundStyle(
                                .white.opacity(0.85)
                            )
                    }
                    .padding()
                }


                // MARK: - Description

                VStack(
                    alignment: .leading,
                    spacing: 10
                ) {

                    Text("About")
                        .font(.title2)
                        .fontWeight(.semibold)


                    Text(place.description)
                        .font(.body)
                        .foregroundStyle(
                            .secondary
                        )
                }


                // MARK: - Map Preview

                VStack(
                    alignment: .leading,
                    spacing: 12
                ) {

                    Text("Location")
                        .font(.title2)
                        .fontWeight(.semibold)


                    Map(
                        initialPosition:
                            .region(mapRegion)
                    ) {

                        Marker(
                            place.name,
                            coordinate:
                                place.coordinate
                        )
                    }
                    .frame(height: 220)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 20
                        )
                    )
                    .allowsHitTesting(false)
                }


                // MARK: - Coordinates

                VStack(
                    alignment: .leading,
                    spacing: 8
                ) {

                    Label(
                        "Latitude: \(place.latitude, specifier: "%.4f")",
                        systemImage:
                            "location.fill"
                    )


                    Label(
                        "Longitude: \(place.longitude, specifier: "%.4f")",
                        systemImage:
                            "mappin.and.ellipse"
                    )
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                // MARK: - Favourite Button

                Button {

                    toggleFavorite()

                } label: {

                    HStack {

                        Image(
                            systemName:
                                isFavorite
                                ? "heart.fill"
                                : "heart"
                        )
                        .scaleEffect(
                            isFavorite
                            ? 1.15
                            : 1.0
                        )


                        Text(
                            isFavorite
                            ? "Saved to Favourites"
                            : "Save to Favourites"
                        )
                        .fontWeight(.semibold)


                        Spacer()
                    }
                    .padding()
                    .foregroundStyle(
                        isFavorite
                        ? .white
                        : .blue
                    )
                    .background(

                        RoundedRectangle(
                            cornerRadius: 16
                        )
                        .fill(
                            isFavorite
                            ? Color.blue
                            : Color.blue.opacity(
                                0.10
                            )
                        )
                    )
                }
                .buttonStyle(.plain)
            }
            .padding()
        }
        .navigationTitle("Place Details")
        .navigationBarTitleDisplayMode(
            .inline
        )
        .onAppear {

            checkFavoriteStatus()
        }
    }


    // MARK: - Check Favourite Status

    private func checkFavoriteStatus() {

        let request =
            FavoritePlaceEntity.fetchRequest()

        request.predicate = NSPredicate(
            format: "id == %@",
            place.id as NSUUID
        )


        do {

            let results =
                try viewContext.fetch(
                    request
                )

            isFavorite =
                !results.isEmpty

        } catch {

            print(
                "Failed to check favourite: \(error.localizedDescription)"
            )
        }
    }


    // MARK: - Toggle Favourite

    private func toggleFavorite() {

        if isFavorite {

            removeFavorite()

        } else {

            saveFavorite()
        }
    }


    // MARK: - Save Favourite

    private func saveFavorite() {

        let favorite =
            FavoritePlaceEntity(
                context: viewContext
            )


        favorite.id = place.id
        favorite.name = place.name
        favorite.category =
            place.category
        favorite.placeDescription =
            place.description
        favorite.latitude =
            place.latitude
        favorite.longitude =
            place.longitude
        favorite.imageName =
            place.imageName


        saveContext()


        withAnimation(
            .spring(
                response: 0.35,
                dampingFraction: 0.6
            )
        ) {

            isFavorite = true
        }
    }


    // MARK: - Remove Favourite

    private func removeFavorite() {

        let request =
            FavoritePlaceEntity.fetchRequest()

        request.predicate = NSPredicate(
            format: "id == %@",
            place.id as NSUUID
        )


        do {

            let results =
                try viewContext.fetch(
                    request
                )


            for item in results {

                viewContext.delete(item)
            }


            saveContext()


            withAnimation(
                .spring(
                    response: 0.35,
                    dampingFraction: 0.6
                )
            ) {

                isFavorite = false
            }

        } catch {

            print(
                "Failed to remove favourite: \(error.localizedDescription)"
            )
        }
    }


    // MARK: - Save Core Data Context

    private func saveContext() {

        do {

            try viewContext.save()

        } catch {

            print(
                "Failed to save Core Data: \(error.localizedDescription)"
            )
        }
    }


    // MARK: - Category Icon

    private var categoryIcon: String {

        switch place.category {

        case "Library":
            return "books.vertical.fill"

        case "Lecture Hall":
            return "building.columns.fill"

        case "Laboratory":
            return "flask.fill"

        case "Cafeteria":
            return "fork.knife"

        case "Administration":
            return "building.2.fill"

        case "Student Services":
            return "person.2.fill"

        default:
            return "mappin.circle.fill"
        }
    }
}
