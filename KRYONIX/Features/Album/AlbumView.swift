import SwiftUI

struct AlbumView: View {
    @State private var favoritesOnly = false

    private let items = Array(1...18)

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 3), count: 3), spacing: 3) {
                    ForEach(items, id: \.self) { item in
                        NavigationLink {
                            MemoryDetailView(index: item)
                        } label: {
                            ZStack(alignment: .bottomTrailing) {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white.opacity(0.72))
                                    .aspectRatio(1, contentMode: .fit)
                                    .overlay {
                                        Image(systemName: "photo")
                                            .font(.title)
                                            .foregroundStyle(.secondary)
                                    }
                                if item.isMultiple(of: 5) {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.pink)
                                        .padding(7)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 110)
            }
            .navigationTitle("Album")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        favoritesOnly.toggle()
                    } label: {
                        Image(systemName: favoritesOnly ? "heart.fill" : "heart")
                    }
                    Button {} label: { Image(systemName: "magnifyingglass") }
                    Button {} label: { Image(systemName: "plus") }
                }
            }
        }
    }
}

struct MemoryDetailView: View {
    let index: Int
    @State private var favorite = false

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                RoundedRectangle(cornerRadius: 28)
                    .fill(.white.opacity(0.75))
                    .aspectRatio(0.82, contentMode: .fit)
                    .overlay { Image(systemName: "photo.fill").font(.system(size: 60)).foregroundStyle(.secondary) }

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Kỷ niệm #\(index)").font(.title2.bold())
                        Spacer()
                        Button {
                            withAnimation(.spring(response: 0.28, dampingFraction: 0.55)) {
                                favorite.toggle()
                            }
                        } label: {
                            Image(systemName: favorite ? "heart.fill" : "heart")
                                .font(.title2)
                                .foregroundStyle(favorite ? .pink : .primary)
                                .symbolEffect(.bounce, value: favorite)
                        }
                    }
                    Text("Chú thích và mô tả của ảnh sẽ hiển thị ở đây.")
                    Text("Ngày · Địa điểm · Người đăng")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(18)
                .background(KRYTheme.card, in: RoundedRectangle(cornerRadius: 24))
            }
            .padding()
        }
    }
}
