import SwiftUI

struct HomeView: View {

    @State private var searchText = ""


    private var filteredPlaces: [Place] {

        guard !searchText.isEmpty else {
            return SamplePlaces.places
        }

        return SamplePlaces.places.filter { place in

            place.name
                .localizedCaseInsensitiveContains(
                    searchText
                )
            ||
            place.category
                .localizedCaseInsensitiveContains(
                    searchText
                )
        }
    }


    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(
                    alignment: .leading,
                    spacing: AppTheme.sectionSpacing
                ) {

                    // MARK: - Header

                    VStack(
                        alignment: .leading,
                        spacing: 6
                    ) {

                        Text("Smart Campus")
                            .font(.largeTitle)
                            .fontWeight(.bold)


                        Text(
                            "Find your way around campus"
                        )
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }


                    // MARK: - Search

                    HStack {

                        Image(
                            systemName:
                                "magnifyingglass"
                        )
                        .foregroundStyle(.secondary)
                        .accessibilityHidden(true)


                        TextField(
                            "Search locations",
                            text: $searchText
                        )
                        .textInputAutocapitalization(
                            .never
                        )
                        .autocorrectionDisabled()


                        if !searchText.isEmpty {

                            Button {

                                searchText = ""

                            } label: {

                                Image(
                                    systemName:
                                        "xmark.circle.fill"
                                )
                                .foregroundStyle(
                                    .secondary
                                )
                            }
                            .accessibilityLabel(
                                "Clear search"
                            )
                        }
                    }
                    .campusCardStyle()


                    // MARK: - Quick Access

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


                    // MARK: - Campus Locations

                    Text("Campus Locations")
                        .font(.title2)
                        .fontWeight(.semibold)


                    if filteredPlaces.isEmpty {

                        ContentUnavailableView(
                            "No Locations Found",
                            systemImage:
                                "magnifyingglass",
                            description: Text(
                                "Try another location or category."
                            )
                        )

                    } else {

                        LazyVStack(spacing: 12) {

                            ForEach(
                                filteredPlaces
                            ) { place in

                                NavigationLink {

                                    PlaceDetailView(
                                        place: place
                                    )

                                } label: {

                                    LocationCard(
                                        place: place
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding(
                    AppTheme.standardPadding
                )
            }
            .navigationBarTitleDisplayMode(
                .inline
            )
        }
    }
}


// MARK: - Quick Action Card

struct QuickActionCard: View {

    let title: String
    let icon: String


    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundStyle(
                    AppTheme.accentColor
                )
                .accessibilityHidden(true)


            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
                .multilineTextAlignment(
                    .center
                )
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
        .campusCardStyle()
        .accessibilityElement(
            children: .combine
        )
        .accessibilityLabel(title)
    }
}
