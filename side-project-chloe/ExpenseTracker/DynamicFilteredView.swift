import SwiftUI
import CoreData

struct DynamicFilteredView<Content: View,T>: View where T: NSManagedObject {

    @FetchRequest var request: FetchedResults<T>
    let content: (FetchedResults<T>)->Content
    
    init(startDate: Date,endDate: Date,type: String,@ViewBuilder content: @escaping (FetchedResults<T>)->Content){
        let filterKey = "date"
        var predicate: NSPredicate!
        if type == "ALL"{
            predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@", argumentArray: [startDate,endDate])
        }else{
            predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@ AND type == %@", argumentArray: [startDate,endDate,type])
        }

        _request = FetchRequest(entity: T.entity(), sortDescriptors: [.init(keyPath: \Expense.date, ascending: false)], predicate: type == "NONE" ? nil : predicate,animation: .easeInOut)
        self.content = content
    }
    
    var body: some View {
        content(request)
    }
}
