import SwiftUI

struct ChatView: View {
    @State private var text = ""

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                ZStack(alignment: .bottomTrailing) {
                    Circle().fill(.white.opacity(0.8)).frame(width: 46, height: 46)
                        .overlay(Image(systemName: "person.fill"))
                    Circle().fill(.green).frame(width: 12, height: 12)
                        .overlay(Circle().stroke(.white, lineWidth: 2))
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text("Phương Thanh").font(.headline)
                    Text("Đang hoạt động").font(.caption).foregroundStyle(.green)
                }
                Spacer()
                Button {} label: { Image(systemName: "phone") }
                Button {} label: { Image(systemName: "video") }
            }
            .padding()
            .background(.ultraThinMaterial)

            ScrollView {
                VStack(spacing: 12) {
                    bubble("Hôm nay thế nào rồi?", mine: false)
                    bubble("Nhớ bà xã húi 😼", mine: true)
                }
                .padding()
            }

            HStack(spacing: 9) {
                Button {} label: { Image(systemName: "plus.circle.fill").font(.title2) }
                TextField("Nhắn tin...", text: $text, axis: .vertical)
                    .padding(.horizontal, 14).padding(.vertical, 10)
                    .background(.white.opacity(0.72), in: Capsule())
                Button {} label: { Image(systemName: "face.smiling").font(.title3) }
                Button {
                    text = ""
                } label: {
                    Image(systemName: text.isEmpty ? "mic.fill" : "paperplane.fill")
                        .font(.title3)
                        .contentTransition(.symbolEffect(.replace))
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .padding(.bottom, 84)
            .background(.ultraThinMaterial)
        }
    }

    private func bubble(_ text: String, mine: Bool) -> some View {
        HStack {
            if mine { Spacer(minLength: 50) }
            Text(text)
                .padding(.horizontal, 15).padding(.vertical, 11)
                .background(mine ? KRYTheme.accent.opacity(0.85) : .white.opacity(0.75),
                            in: RoundedRectangle(cornerRadius: 20))
                .foregroundStyle(mine ? .white : .primary)
            if !mine { Spacer(minLength: 50) }
        }
    }
}
