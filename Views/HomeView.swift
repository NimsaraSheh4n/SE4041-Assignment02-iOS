import SwiftUI

struct HomeView: View {

    @State private var searchText = ""

    private var filteredPlaces: [Place] {

        if searchText.isEmpty {
            return SamplePlaces.places
        }

        return SamplePlaces.places.filter { place in

            place.name.localizedCaseInsensitiveContains(searchText) ||
            place.category.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(alignment: .leading, spacing: 22) {

                    // Header
                    VStack(alignment: .leading, spacing: 6) {

                        Text("Smart Campus")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Find your way around campus")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }


                    // Search Bar
                    HStack {

                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.secondary)

                        TextField(
                            "Search locations",
                            text: $searchText
                        )

                        if !searchText.isEmpty {

                            Button {
                                searchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.secondarySystemBackground))
                    )


                    // Quick Actions
                    Text("Quick Access")
                        .font(.title2)
                        .fontWeight(.semibold)

                    HStack(spacing: 14) {

                        NavigationLink {
                            CampusMapView()
                        } label: {

                            QuickActionCard(
                                title: "Campus Map",
                                icon: "map.fill"
                            )
                        }

                        NavigationLink {
                            SavedPlacesView()
                        } label: {

                            QuickActionCard(
                                title: "Saved Places",
                                icon: "heart.fill"
                            )
                        }
                    }


                    // Locations
                    Text("Campus Locations")
                        .font(.title2)
                        .fontWeight(.semibold)

                    if filteredPlaces.isEmpty {

                        ContentUnavailableView(
                            "No Locations Found",
                            systemImage: "magnifyingglass",
                            description: Text(
                                "Try searching using another location or category."
                            )
                        )

                    } else {

                        LazyVStack(spacing: 12) {

                            ForEach(filteredPlaces) { place in

                                NavigationLink {
                                    PlaceDetailView(place: place)
                                } label: {

                                    LocationCard(place: place)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


// Custom Quick Action Component

struct QuickActionCard: View {

    let title: String
    let icon: String

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundStyle(.blue)

            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.secondarySystemBackground))
        )
    }
}
