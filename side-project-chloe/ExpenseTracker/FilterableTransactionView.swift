import SwiftUI

struct FilterableTransactionView: View{
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(\.self) var env
    @Namespace var animation
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                HStack(spacing: 15){
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward.circle.fill")
                            .foregroundColor(Color("Gray"))
                            .frame(width: 40, height: 40)
                            .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                    
                    Text("Transactions")
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .opacity(0.7)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    
                    Button {
                        expenseViewModel.showFilters.toggle()
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(Color("Gray"))
                            .frame(width: 40, height: 40)
                            .background(Color.white,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
                
                DynamicFilteredView(startDate: expenseViewModel.startDate, endDate: expenseViewModel.endDate, type: "ALL") { (expenses: FetchedResults<Expense>) in
                    VStack{
                        ExpenseCard(expenses: expenses,isDetail: true)
                            .environmentObject(expenseViewModel)
                        
                        CustomSegmentedControl()
                            .padding(.top)
                    }
                }

                DynamicFilteredView(startDate: expenseViewModel.startDate, endDate: expenseViewModel.endDate, type: expenseViewModel.currentType){(expenses: FetchedResults<Expense>) in
                    VStack{
                        
                        VStack(spacing: 15){
                            Text(expenseViewModel.convertDateToString())
                                .opacity(0.7)
                            
                            if expenses.isEmpty{
                                Text("No History Found")
                                    .fontWeight(.semibold)
                                    .opacity(0.7)
                                    .padding(.top,5)
                            }else{
                                Text(expenseViewModel.convertExpensesToPrice(expenses: expenses))
                                    .font(.largeTitle.bold())
                                    .opacity(0.9)
                                    .animation(.none, value: expenses.count)
                            }
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background{
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(.white)
                        }
                        .padding(.vertical,20)
                        
                        ForEach(expenses){expense in
                            TransactionCardView(expense: expense)
                                .environmentObject(expenseViewModel)
                        }
                    }
                }
            }
            .padding()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
        .overlay(content: {
            FilterPopUpView()
        })
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    func CustomSegmentedControl()->some View{
        HStack(spacing: 0){
            ForEach(["Income","Expenses"],id: \.self){type in
                Text(type)
                    .fontWeight(.semibold)
                    .foregroundColor(expenseViewModel.currentType == type ? .white : .black)
                    .opacity(expenseViewModel.currentType == type ? 1 : 0.7)
                    .padding(.vertical,12)
                    .frame(maxWidth: .infinity)
                    .background{
                        if expenseViewModel.currentType == type{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(
                                    .linearGradient(colors: [
                                        Color("Gradient1"),
                                        Color("Gradient2"),
                                        Color("Gradient3"),
                                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation{
                            expenseViewModel.currentType = type
                        }
                    }
            }
        }
        .padding(5)
        .background{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
        }
    }
    
    @ViewBuilder
    func FilterPopUpView()->some View{
        ZStack{
            Color.black
                .opacity(expenseViewModel.showFilters ? 0.35 : 0)
                .ignoresSafeArea()
            
            if expenseViewModel.showFilters{
                VStack(alignment: .leading, spacing: 10) {
                    Text("Start Date")
                        .font(.caption)
                        .opacity(0.7)
                    
                    DatePicker("", selection: $expenseViewModel.startDate,in: Date.distantPast...Date(),displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                    
                    Text("End Date")
                        .font(.caption)
                        .opacity(0.7)
                        .padding(.top,10)
                    
                    DatePicker("", selection: $expenseViewModel.endDate,in: Date.distantPast...Date(),displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                }
                .padding(20)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                }
                .overlay(alignment: .topTrailing, content: {
                    Button {
                        expenseViewModel.showFilters.toggle()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    .padding(5)

                })
                .padding()
            }
        }
        .animation(.easeInOut, value: expenseViewModel.showFilters)
    }
}

struct FilterableTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Model())
    }
}

