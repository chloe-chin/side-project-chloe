import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var model: Model
    @AppStorage("creditscore") var creditscore = ""
    @AppStorage("networth") var networth = ""
    @AppStorage("debt") var debt = ""
    @AppStorage("income") var income = ""
    @AppStorage("goal") var goal = "Create an emergency fund"
    let goals = ["impove my credit score", "get out of debt", "create an emergency fund", "build a budget", "learn how to invest"]
    
    @State var appear = [false, false, false]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("My Profile")
                .font(.largeTitle).bold()
                .slideFadeIn(show: appear[0], offset: 30)
            Text("Common Cents does not share or sell your data")
                .font(.caption)
                .opacity(0.5)
            form.slideFadeIn(show: appear[2], offset: 10)
        }
        .coordinateSpace(name: "stack")
        .padding(20)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .backgroundColor(opacity: 0.4)
        .cornerRadius(30)
        .modifier(OutlineModifier(cornerRadius: 30))
        .onAppear { animate() }
        .background(Image("Blob 1"))
        
    }
    
    var form: some View {
        Group {
            VStack {
                TextField("credit score", text: $creditscore)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .customField(icon: "creditcard.fill")
                
                TextField("income", text: $income)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .customField(icon: "dollarsign.circle.fill")
                
                TextField("net worth", text: $networth)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .customField(icon: "dollarsign.circle.fill")
                
                TextField("debt", text: $debt)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .customField(icon: "dollarsign.circle.fill")
            
                
                Text("choose your main goal")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding([.top, .trailing])
                    .opacity(0.4)
                    

                Picker("Goal", selection: $goal) {
                    ForEach(goals, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
                .foregroundColor(Color.gray)
                
                
                Button {
                    dismiss()
                } label: {
                    AngularButton(title: "Done")
                }
                
                
            }
        
        }
    }
    
    var form2: some View {
        Group {
            Picker("Goal", selection: $goal) {
                ForEach(goals, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
        }
    }
    
    func animate() {
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.2)) {
            appear[0] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8).delay(0.6)) {
            appear[2] = true
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(Model())
    }
}
