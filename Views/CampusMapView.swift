import SwiftUI
import MapKit

struct CampusMapView: View {

    @State private var selectedPlace: Place?

    @State private var selectedCategory = "All"

    @State private var position: MapCameraPosition =
        .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 6.9147,
                    longitude: 79.9731
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.006,
                    longitudeDelta: 0.006
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

            // MARK: - Campus Map

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

                            VStack(spacing: 4) {

                                Image(
                                    systemName:
                                        categoryIcon(
                                            for:
                                                place.category
                                        )
                                )
                                .font(
                                    .system(size: 18)
                                )
                                .foregroundStyle(.white)
                                .frame(
                                    width: 40,
                                    height: 40
                                )
                                .background(
                                    Circle()
                                        .fill(
                                            selectedPlace?.id
                                            == place.id
                                            ? Color.indigo
                                            : AppTheme.accentColor
                                        )
                                )
                                .shadow(
                                    radius: 4
                                )


                                if selectedPlace?.id
                                    == place.id {

                                    Text(place.name)
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(
                                            .primary
                                        )
                                        .padding(
                                            .horizontal,
                                            8
                                        )
                                        .padding(
                                            .vertical,
                                            4
                                        )
                                        .background(
                                            .regularMaterial,
                                            in:
                                                Capsule()
                                        )
                                }
                            }
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel(
                            "\(place.name), \(place.category)"
                        )
                        .accessibilityHint(
                            "Shows location information"
                        )
                    }
                }
            }
            .mapStyle(.standard)
            .mapControls {

                MapCompass()

                MapScaleView()
            }
            .ignoresSafeArea(
                edges: .bottom
            )


            // MARK: - Top Category Filters

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
                                    .easeInOut(
                                        duration: 0.2
                                    )
                                ) {

                                    selectedCategory =
                                        category

                                    selectedPlace = nil
                                }

                            } label: {

                                Text(category)
                                    .font(
                                        .subheadline
                                    )
                                    .fontWeight(
                                        .medium
                                    )
                                    .padding(
                                        .horizontal,
                                        14
                                    )
                                    .padding(
                                        .vertical,
                                        8
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
                            .accessibilityLabel(
                                "\(category) category"
                            )
                        }
                    }
                    .padding(
                        .horizontal,
                        AppTheme.standardPadding
                    )
                }
                .padding(.top, 10)


                Spacer()
            }


            // MARK: - Selected Place Card

            if let selectedPlace {

                VStack(
                    alignment: .leading,
                    spacing: 14
                ) {

                    HStack(
                        alignment: .top,
                        spacing: 12
                    ) {

                        Image(
                            systemName:
                                categoryIcon(
                                    for:
                                        selectedPlace.category
                                )
                        )
                        .font(
                            .system(size: 24)
                        )
                        .foregroundStyle(
                            AppTheme.accentColor
                        )
                        .frame(
                            width: 50,
                            height: 50
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
                            spacing: 4
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

                            withAnimation {

                                self.selectedPlace =
                                    nil
                            }

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
                            "Close location preview"
                        )
                    }


                    Text(
                        selectedPlace.description
                    )
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)


                    NavigationLink {

                        PlaceDetailView(
                            place: selectedPlace
                        )

                    } label: {

                        HStack {

                            Text(
                                "View Place Details"
                            )

                            Spacer()

                            Image(
                                systemName:
                                    "arrow.right"
                            )
                        }
                        .primaryActionStyle()
                    }
                    .buttonStyle(.plain)
                }
                .campusCardStyle()
                .padding(
                    .horizontal,
                    AppTheme.standardPadding
                )
                .padding(.bottom, 12)
                .transition(
                    .move(edge: .bottom)
                    .combined(
                        with: .opacity
                    )
                )
            }
        }
        .navigationTitle("Campus Map")
        .navigationBarTitleDisplayMode(
            .inline
        )
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

        case "Recreation":
            return "figure.run"

        case "Parking":
            return "car.fill"

        default:
            return "mappin.circle.fill"
        }
    }
}
