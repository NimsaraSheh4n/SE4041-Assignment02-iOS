import SwiftUI
import CoreData

struct SavedPlacesView: View {

    // Core Data Context
    @Environment(\.managedObjectContext)
    private var viewContext


    // Fetch Saved Places
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(
                keyPath: \FavoritePlaceEntity.name,
                ascending: true
            )
        ],
        animation: .default
    )
    private var savedPlaces:
        FetchedResults<FavoritePlaceEntity>


    var body: some View {

        Group {

            // Empty State
            if savedPlaces.isEmpty {

                ContentUnavailableView(
                    "No Saved Places",
                    systemImage: "heart.slash",
                    description: Text(
                        "Places you save will appear here."
                    )
                )

            } else {

                // Saved Places List
                List {

                    ForEach(savedPlaces) { savedPlace in

                        NavigationLink {

                            PlaceDetailView(
                                place: savedPlace.asPlace
                            )

                        } label: {

                            savedPlaceRow(savedPlace)
                        }
                    }
                    .onDelete(perform: deletePlaces)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Saved Places")
        .navigationBarTitleDisplayMode(.inline)
    }


    // MARK: - Saved Place Row

    private func savedPlaceRow(
        _ savedPlace: FavoritePlaceEntity
    ) -> some View {

        HStack(spacing: 14) {

            Image(
                systemName: iconName(
                    for: savedPlace.wrappedCategory
                )
            )
            .font(.system(size: 22))
            .foregroundStyle(.blue)
            .frame(width: 46, height: 46)
            .background(
                RoundedRectangle(cornerRadius: 13)
                    .fill(Color.blue.opacity(0.12))
            )


            VStack(
                alignment: .leading,
                spacing: 5
            ) {

                Text(savedPlace.wrappedName)
                    .font(.headline)

                Text(savedPlace.wrappedCategory)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                if !savedPlace.wrappedDescription.isEmpty {

                    Text(savedPlace.wrappedDescription)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }


            Spacer()
        }
        .padding(.vertical, 6)
    }


    // MARK: - Delete Saved Place

    private func deletePlaces(
        offsets: IndexSet
    ) {

        withAnimation {

            offsets
                .map { savedPlaces[$0] }
                .forEach(viewContext.delete)


            do {

                try viewContext.save()

            } catch {

                print(
                    "Failed to delete saved place: \(error.localizedDescription)"
                )
            }
        }
    }


    // MARK: - Category Icon

    private func iconName(
        for category: String
    ) -> String {

        switch category {

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
