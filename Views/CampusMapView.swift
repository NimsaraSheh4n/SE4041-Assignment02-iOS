import SwiftUI
import MapKit

struct CampusMapView: View {

    @State private var selectedPlace: Place?

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

    var body: some View {

        ZStack(alignment: .bottom) {

            // Campus Map
            Map(position: $position) {

                ForEach(SamplePlaces.places) { place in

                    Annotation(
                        place.name,
                        coordinate: place.coordinate
                    ) {

                        Button {

                            withAnimation(.spring()) {
                                selectedPlace = place
                            }

                        } label: {

                            Image(systemName: "mappin.circle.fill")
                                .font(.system(size: 34))
                                .foregroundStyle(.red)
                                .background(
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 25, height: 25)
                                )
                        }
                    }
                }
            }
            .mapStyle(.standard)
            .ignoresSafeArea(edges: .bottom)


            // Selected Location Card
            if let selectedPlace {

                VStack(spacing: 12) {

                    HStack {

                        VStack(
                            alignment: .leading,
                            spacing: 5
                        ) {

                            Text(selectedPlace.name)
                                .font(.headline)

                            Text(selectedPlace.category)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Button {

                            withAnimation(.easeOut) {
                                self.selectedPlace = nil
                            }

                        } label: {

                            Image(
                                systemName: "xmark.circle.fill"
                            )
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        }
                    }


                    NavigationLink {

                        PlaceDetailView(
                            place: selectedPlace
                        )

                    } label: {

                        Text("View Details")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background(
                                RoundedRectangle(
                                    cornerRadius: 14
                                )
                                .fill(.blue)
                            )
                    }
                }
                .padding()
                .background(
                    .ultraThinMaterial,
                    in: RoundedRectangle(
                        cornerRadius: 22
                    )
                )
                .padding()
                .transition(
                    .move(edge: .bottom)
                    .combined(with: .opacity)
                )
            }
        }
        .navigationTitle("Campus Map")
        .navigationBarTitleDisplayMode(.inline)
    }
}
