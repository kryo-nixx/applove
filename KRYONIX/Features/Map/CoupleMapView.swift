import SwiftUI
import MapKit

struct CoupleMapView: View {
    @State private var position: MapCameraPosition = .automatic

    var body: some View {
        ZStack {
            Map(position: $position) {
                Annotation("Sơn · 82%", coordinate: CLLocationCoordinate2D(latitude: 21.0285, longitude: 105.8542)) {
                    personMarker(name: "S", battery: "82%")
                }
                Annotation("Thanh · 67%", coordinate: CLLocationCoordinate2D(latitude: 21.0385, longitude: 105.8442)) {
                    personMarker(name: "T", battery: "67%")
                }
            }
            .ignoresSafeArea()

            VStack {
                HStack {
                    statusCard("Sơn", "82%", "Vừa cập nhật")
                    statusCard("Thanh", "67%", "2 phút trước")
                }
                .padding(.horizontal, 12)
                .padding(.top, 8)
                Spacer()
                Text("Vị trí demo · bản thật chỉ chia sẻ khi người dùng bật quyền")
                    .font(.caption2.weight(.semibold))
                    .padding(.horizontal, 12).padding(.vertical, 8)
                    .background(.ultraThinMaterial, in: Capsule())
                    .padding(.bottom, 105)
            }
        }
    }

    private func personMarker(name: String, battery: String) -> some View {
        VStack(spacing: 3) {
            Circle()
                .fill(.white)
                .frame(width: 54, height: 54)
                .overlay(Text(name).font(.title.bold()))
                .shadow(radius: 6)
            Text(battery)
                .font(.caption2.bold())
                .padding(.horizontal, 7).padding(.vertical, 3)
                .background(.ultraThinMaterial, in: Capsule())
        }
    }

    private func statusCard(_ name: String, _ battery: String, _ status: String) -> some View {
        HStack(spacing: 8) {
            Circle().fill(.white.opacity(0.9)).frame(width: 34, height: 34)
                .overlay(Text(String(name.prefix(1))).bold())
            VStack(alignment: .leading, spacing: 1) {
                Text(name).font(.caption.bold())
                Label(battery, systemImage: "battery.75percent")
                    .font(.caption2)
                Text(status).font(.caption2).foregroundStyle(.secondary)
            }
        }
        .padding(9)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18))
    }
}
