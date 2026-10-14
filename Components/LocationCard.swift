import SwiftUI

struct LocationCard: View {

    let place: Place

    var body: some View {

        HStack(spacing: 14) {

            Image(systemName: iconName)
                .font(.system(size: 24))
                .foregroundStyle(.blue)
                .frame(width: 50, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.blue.opacity(0.12))
                )

            VStack(alignment: .leading, spacing: 6) {

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
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.secondarySystemBackground))
        )
    }

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

        default:
            return "mappin.circle.fill"
        }
    }
}
