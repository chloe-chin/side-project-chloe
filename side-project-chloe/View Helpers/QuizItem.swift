import SwiftUI

struct QuizItem: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Text("Credit Scores, Budgeting, and Savings")
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Test your new knowledge".uppercased())
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.secondary)
            Text("click here to take the quiz!")
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
            Image("Background 3")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    }
}

struct CreditScoreItem_Previews: PreviewProvider {
    static var previews: some View {
        QuizItem()
    }
}

