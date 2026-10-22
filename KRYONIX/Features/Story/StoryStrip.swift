import SwiftUI

struct StoryStrip: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Story")
                    .font(.title3.bold())
                Spacer()
                Button {
                } label: {
                    Label("Thêm", systemImage: "plus")
                        .font(.subheadline.bold())
                }
            }

            HStack(spacing: 16) {
                story(name: "Sơn", nick: "@son", systemImage: "person.crop.circle.fill")
                story(name: "Thanh", nick: "@thanh", systemImage: "person.crop.circle.fill")
            }
        }
        .padding(18)
        .background(KRYTheme.card, in: RoundedRectangle(cornerRadius: 28))
    }

    private func story(name: String, nick: String, systemImage: String) -> some View {
        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .stroke(
                        LinearGradient(colors: [.pink, .purple, .orange], startPoint: .topLeading, endPoint: .bottomTrailing),
                        lineWidth: 3
                    )
                    .frame(width: 68, height: 68)
                Image(systemName: systemImage)
                    .font(.system(size: 53))
            }
            Text(name).font(.caption.bold())
            Text(nick).font(.caption2).foregroundStyle(.secondary)
        }
    }
}
