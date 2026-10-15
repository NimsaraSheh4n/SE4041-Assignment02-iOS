import SwiftUI

struct LocationCard: View {

    let place: Place

    var body: some View {

        HStack(spacing: 14) {

            // Category Icon
            Image(systemName: iconName)
                .font(.system(size: 24))
                .foregroundStyle(AppTheme.accentColor)
                .frame(width: 50, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(
                            AppTheme.accentColor
                                .opacity(0.12)
                        )
                )
                .accessibilityHidden(true)


            // Place Information
            VStack(
                alignment: .leading,
                spacing: 6
            ) {

                Text(place.name)
                    .font(.headline)
                    .foregroundStyle(.primary)


                Text(place.category)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)


                Text(place.description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }


            Spacer()


            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.secondary)
                .accessibilityHidden(true)
        }
        .campusCardStyle()

        // Accessibility
        .accessibilityElement(
            children: .combine
        )
        .accessibilityLabel(
            "\(place.name), \(place.category)"
        )
        .accessibilityHint(
            "Opens location details"
        )
    }


    // MARK: - Category Icon

    private var iconName: String {

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

        case "Recreation":
            return "figure.run"

        case "Parking":
            return "car.fill"

        default:
            return "mappin.circle.fill"
        }
    }
}
