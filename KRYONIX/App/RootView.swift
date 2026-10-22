import SwiftUI

enum KRYTab: String, CaseIterable {
    case home = "Home"
    case album = "Album"
    case chat = "Chat"
    case map = "Map"
    case us = "Us"

    var symbol: String {
        switch self {
        case .home: return "house"
        case .album: return "photo.on.rectangle.angled"
        case .chat: return "bubble.left.and.bubble.right"
        case .map: return "map"
        case .us: return "person.2"
        }
    }
}

struct RootView: View {
    @State private var tab: KRYTab = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch tab {
                case .home: HomeView()
                case .album: AlbumView()
                case .chat: ChatView()
                case .map: CoupleMapView()
                case .us: UsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: 8) {
                ForEach(KRYTab.allCases, id: \.self) { item in
                    Button {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.72)) {
                            tab = item
                        }
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: tab == item ? item.symbol + ".fill" : item.symbol)
                                .font(.system(size: 18, weight: .semibold))
                                .symbolEffect(.bounce, value: tab == item)
                            Text(item.rawValue)
                                .font(.caption2.weight(.semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(tab == item ? .primary : .secondary)
                        .padding(.vertical, 9)
                        .background {
                            if tab == item {
                                Capsule().fill(.white.opacity(0.65))
                                    .matchedGeometryEffectPlaceholder()
                            }
                        }
                    }
                }
            }
            .padding(8)
            .background(.ultraThinMaterial, in: Capsule())
            .padding(.horizontal, 14)
            .padding(.bottom, 7)
        }
        .background(KRYTheme.background.ignoresSafeArea())
    }
}

private extension View {
    func matchedGeometryEffectPlaceholder() -> some View { self }
}
