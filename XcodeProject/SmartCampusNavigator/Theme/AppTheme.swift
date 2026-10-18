import SwiftUI

// MARK: - App Theme

enum AppTheme {

    static let cornerRadius: CGFloat = 18
    static let largeCornerRadius: CGFloat = 24

    static let standardPadding: CGFloat = 16
    static let sectionSpacing: CGFloat = 22

    static let accentColor = Color.blue

    static let cardBackground =
        Color(.secondarySystemBackground)
}


// MARK: - Custom Card Modifier

struct CampusCardModifier: ViewModifier {

    func body(content: Content) -> some View {

        content
            .padding(AppTheme.standardPadding)
            .background(
                RoundedRectangle(
                    cornerRadius: AppTheme.cornerRadius
                )
                .fill(AppTheme.cardBackground)
            )
            .overlay(
                RoundedRectangle(
                    cornerRadius: AppTheme.cornerRadius
                )
                .stroke(
                    Color.primary.opacity(0.05),
                    lineWidth: 1
                )
            )
    }
}


// MARK: - View Extension

extension View {

    func campusCardStyle() -> some View {
        modifier(CampusCardModifier())
    }
}


// MARK: - Primary Action Button Modifier

struct PrimaryActionButtonModifier: ViewModifier {

    func body(content: Content) -> some View {

        content
            .font(.headline)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(
                    cornerRadius: 16
                )
                .fill(AppTheme.accentColor)
            )
    }
}


// MARK: - View Extension

extension View {

    func primaryActionStyle() -> some View {
        modifier(
            PrimaryActionButtonModifier()
        )
    }
}
