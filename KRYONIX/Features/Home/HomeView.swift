import SwiftUI

struct HomeView: View {
    private let startDate = Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 17))!

    var daysTogether: Int {
        Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                Text("KRYONIX")
                    .font(.system(size: 32, weight: .black, design: .rounded))

                VStack(alignment: .leading, spacing: 8) {
                    Text("Sơn × Thanh")
                        .font(.headline)
                    Text("\(daysTogether)")
                        .font(.system(size: 58, weight: .black, design: .rounded))
                        .contentTransition(.numericText())
                    Text("ngày bên nhau")
                        .font(.title3.weight(.semibold))
                    Text("17.12.2023 → Hôm nay")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(KRYTheme.card, in: RoundedRectangle(cornerRadius: 28))

                StoryStrip()

                Text("Nếu được chọn lại, anh vẫn muốn gặp em.")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding(20)
                    .background(.white.opacity(0.6), in: RoundedRectangle(cornerRadius: 28))
            }
            .padding(.horizontal, 16)
            .padding(.top, 18)
            .padding(.bottom, 110)
        }
    }
}
