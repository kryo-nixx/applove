import SwiftUI

struct UsView: View {
    @State private var effect = "Aurora"
    private let effects = ["Aurora", "Orbit", "Spark", "Soft Glow"]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    LinearGradient(colors: [.purple.opacity(0.55), .pink.opacity(0.45), .mint.opacity(0.5)],
                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(height: 210)

                    ZStack {
                        Circle().fill(.white).frame(width: 112, height: 112)
                        Circle()
                            .stroke(LinearGradient(colors: [.pink, .purple, .cyan], startPoint: .top, endPoint: .bottom),
                                    lineWidth: 5)
                            .frame(width: 106, height: 106)
                            .rotationEffect(.degrees(effect == "Orbit" ? 30 : 0))
                        Image(systemName: "person.fill")
                            .font(.system(size: 54))
                    }
                    .offset(x: 18, y: 48)
                }

                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Sơn").font(.system(size: 30, weight: .black, design: .rounded))
                            Text("@son").foregroundStyle(.secondary)
                        }
                        Spacer()
                        Button("Sửa hồ sơ") {}
                            .buttonStyle(.borderedProminent)
                            .tint(KRYTheme.accent)
                    }

                    Text("Không gian riêng của hai đứa ✨")
                    Divider()

                    Text("Hiệu ứng avatar").font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(effects, id: \.self) { item in
                                Button(item) {
                                    withAnimation(.spring(response: 0.35, dampingFraction: 0.65)) { effect = item }
                                }
                                .buttonStyle(.bordered)
                                .tint(effect == item ? KRYTheme.accent : .secondary)
                            }
                        }
                    }

                    Text("Ảnh bìa, avatar, nickname, bio, badge và hiệu ứng sẽ đồng bộ qua tài khoản sau khi nối backend.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 62)
                .padding(.horizontal, 18)
                .padding(.bottom, 120)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}
