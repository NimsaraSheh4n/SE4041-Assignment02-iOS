import SwiftUI
import MapKit

struct CampusMapView: View {

    @State private var selectedPlace: Place?
    @State private var selectedCategory = "All"

    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 6.9147,
                longitude: 79.9731
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.004,
                longitudeDelta: 0.004
            )
        )
    )


    private let categories = [
        "All",
        "Library",
        "Lecture Hall",
        "Laboratory",
        "Cafeteria",
        "Administration",
        "Student Services"
    ]


    private var filteredPlaces: [Place] {

        if selectedCategory == "All" {
            return SamplePlaces.places
        }

        return SamplePlaces.places.filter {
            $0.category == selectedCategory
        }
    }


    var body: some View {

        ZStack(alignment: .bottom) {

            // MARK: - Map

            Map(position: $position) {

                ForEach(filteredPlaces) { place in

                    Annotation(
                        place.name,
                        coordinate: place.coordinate
                    ) {

                        Button {

                            withAnimation(
                                .spring(
                                    response: 0.35,
                                    dampingFraction: 0.75
                                )
                            ) {
                                selectedPlace = place
                            }

                        } label: {

                            VStack(spacing: 2) {

                                Image(
                                    systemName:
                                        selectedPlace?.id == place.id
                                        ? "mappin.circle.fill"
                                        : "mappin.circle"
                                )
                                .font(
                                    .system(size: 34)
                                )
                                .foregroundStyle(
                                    selectedPlace?.id == place.id
                                    ? .blue
                                    : .red
                                )

                                if selectedPlace?.id == place.id {

                                    Text(place.name)
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.primary)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            .ultraThinMaterial,
                                            in: Capsule()
                                        )
                                }
                            }
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel(place.name)
                        .accessibilityHint(
                            "Select this campus location"
                        )
                    }
                }
            }
            .mapStyle(.standard)
            .mapControls {
                MapCompass()
                MapScaleView()
            }
            .ignoresSafeArea(edges: .bottom)


            // MARK: - Category Filter

            VStack {

                ScrollView(
                    .horizontal,
                    showsIndicators: false
                ) {

                    HStack(spacing: 10) {

                        ForEach(
                            categories,
                            id: \.self
                        ) { category in

                            Button {

                                withAnimation(
                                    .easeInOut(duration: 0.2)
                                ) {

                                    selectedCategory =
                                        category

                                    selectedPlace = nil
                                }

                            } label: {

                                Text(category)
                                    .font(.subheadline)
                                    .fontWeight(
                                        .semibold
                                    )
                                    .padding(
                                        .horizontal,
                                        14
                                    )
                                    .padding(
                                        .vertical,
                                        9
                                    )
                                    .foregroundStyle(
                                        selectedCategory
                                            == category
                                        ? .white
                                        : .primary
                                    )
                                    .background(
                                        Capsule()
                                            .fill(
                                                selectedCategory
                                                    == category
                                                ? AppTheme
                                                    .accentColor
                                                : Color(
                                                    .secondarySystemBackground
                                                )
                                            )
                                    )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }
            .padding(.top, 8)


            // MARK: - Selected Place Card

            if let selectedPlace {

                VStack(spacing: 14) {

                    HStack {

                        Image(
                            systemName:
                                categoryIcon(
                                    for:
                                        selectedPlace
                                            .category
                                )
                        )
                        .font(.system(size: 24))
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
                                selectedPlace.name
                            )
                            .font(.headline)


                            Text(
                                selectedPlace.category
                            )
                            .font(.subheadline)
                            .foregroundStyle(
                                .secondary
                            )
                        }


                        Spacer()


                        Button {

                            withAnimation(
                                .easeOut(
                                    duration: 0.2
                                )
                            ) {

                                self.selectedPlace =
                                    nil
                            }

                        } label: {

                            Image(
                                systemName:
                                    "xmark.circle.fill"
                            )
                            .font(.title3)
                            .foregroundStyle(
                                .secondary
                            )
                        }
                        .accessibilityLabel(
                            "Close location preview"
                        )
                    }


                    Text(
                        selectedPlace.description
                    )
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )


                    NavigationLink {

                        PlaceDetailView(
                            place:
                                selectedPlace
                        )

                    } label: {

                        Text("View Details")
                            .primaryActionStyle()
                    }
                }
                .campusCardStyle()
                .padding()
                .background(
                    .ultraThinMaterial
                )
                .transition(
                    .move(edge: .bottom)
                    .combined(
                        with: .opacity
                    )
                )
            }
        }
        .navigationTitle("Campus Map")
        .navigationBarTitleDisplayMode(.inline)
    }


    // MARK: - Category Icon

    private func categoryIcon(
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
