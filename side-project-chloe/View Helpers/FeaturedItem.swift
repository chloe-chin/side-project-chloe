import SwiftUI

struct FeaturedItem: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Text("Finance Tracker")
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Your Expenses".uppercased())
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.secondary)
            Text("Track all of your daily purchases here")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 40)
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .background(.ultraThinMaterial)
        .backgroundColor(opacity: 0.5)
        .background(
            Image("Blob 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem()
    }
}

