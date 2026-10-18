import SwiftUI
import CoreData

struct SavedPlacesView: View {

    @Environment(\.managedObjectContext)
    private var viewContext

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

            if savedPlaces.isEmpty {

                // MARK: - Empty State

                ContentUnavailableView {

                    Label(
                        "No Saved Places",
                        systemImage: "heart.slash"
                    )

                } description: {

                    Text(
                        "Save important campus locations and they will appear here."
                    )
                }

            } else {

                // MARK: - Saved Places List

                List {

                    ForEach(savedPlaces) { savedPlace in

                        NavigationLink {

                            PlaceDetailView(
                                place: savedPlace.asPlace
                            )

                        } label: {

                            savedPlaceRow(
                                savedPlace
                            )
                        }
                        .accessibilityLabel(
                            "\(savedPlace.wrappedName), \(savedPlace.wrappedCategory)"
                        )
                        .accessibilityHint(
                            "Opens saved location details"
                        )
                    }
                    .onDelete(
                        perform: deletePlaces
                    )
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Saved Places")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {

            if !savedPlaces.isEmpty {

                EditButton()
            }
        }
    }


    // MARK: - Saved Place Row

    private func savedPlaceRow(
        _ savedPlace: FavoritePlaceEntity
    ) -> some View {

        HStack(spacing: 14) {

            Image(
                systemName:
                    iconName(
                        for:
                            savedPlace
                                .wrappedCategory
                    )
            )
            .font(.system(size: 22))
            .foregroundStyle(
                AppTheme.accentColor
            )
            .frame(
                width: 48,
                height: 48
            )
            .background(

                RoundedRectangle(
                    cornerRadius: 14
                )
                .fill(
                    AppTheme
                        .accentColor
                        .opacity(0.12)
                )
            )
            .accessibilityHidden(true)


            VStack(
                alignment: .leading,
                spacing: 5
            ) {

                Text(
                    savedPlace.wrappedName
                )
                .font(.headline)


                Text(
                    savedPlace.wrappedCategory
                )
                .font(.subheadline)
                .foregroundStyle(.secondary)


                if !savedPlace
                    .wrappedDescription
                    .isEmpty {

                    Text(
                        savedPlace
                            .wrappedDescription
                    )
                    .font(.caption)
                    .foregroundStyle(
                        .secondary
                    )
                    .lineLimit(2)
                }
            }


            Spacer()


            Image(
                systemName:
                    "chevron.right"
            )
            .font(.caption)
            .foregroundStyle(.secondary)
            .accessibilityHidden(true)
        }
        .padding(.vertical, 6)
    }


    // MARK: - Delete Saved Place

    private func deletePlaces(
        offsets: IndexSet
    ) {

        withAnimation {

            offsets
                .map {
                    savedPlaces[$0]
                }
                .forEach(
                    viewContext.delete
                )


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

        case "Recreation":
            return "figure.run"

        case "Parking":
            return "car.fill"

        default:
            return "mappin.circle.fill"
        }
    }
}
