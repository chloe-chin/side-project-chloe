import SwiftUI

struct StatisticsGraph: Identifiable{
    var id = UUID().uuidString
    var monthString: String
    var monthDate: Date
    var expenses: [Expense]
}
