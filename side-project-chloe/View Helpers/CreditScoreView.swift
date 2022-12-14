import SwiftUI

struct CreditScoreView: View {
    var namespace: Namespace.ID
    @Binding var course: Course
    var isAnimated = true
    
    @State var viewState: CGSize = .zero
    @State var showSection = false
    @State var appear = [false, false, false]
    @State var selectedSection = courseSections[0]
    
    @EnvironmentObject var model: Model
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                sectionsSection
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: appear[0] ? 0 : 30))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3))
            .modifier(OutlineModifier(cornerRadius: viewState.width / 3))
            .shadow(color: Color("Shadow").opacity(0.5), radius: 30, x: 0, y: 10)
            .scaleEffect(-viewState.width/500 + 1)
            .background(Color("Shadow").opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(isAnimated ? drag : nil)
            .ignoresSafeArea()
            
            Button {
                isAnimated ?
                withAnimation(.closeCard) {
                    model.showDetail = false
                    model.selectedCourse = 0
                }
                : presentationMode.wrappedValue.dismiss()
            } label: {
                CloseButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
            
//            LogoView(image: course.logo)
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//                .padding(20)
//                .matchedGeometryEffect(id: "logo\(course.index)", in: namespace)
//                .ignoresSafeArea()
//                .accessibility(hidden: true)
        }
        .zIndex(1)
        .onAppear { fadeIn() }
        .onChange(of: model.showDetail) { show in
           fadeOut()
        }
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .background(
                Image("Illustration 14")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .matchedGeometryEffect(id: "Illustration 14", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .accessibility(hidden: true)
            )
            .background(
                Image(course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(course.index)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY > 0 ? scrollY / 10 : 0)
                    .accessibility(hidden: true)
            )
            .mask(
                RoundedRectangle(cornerRadius: appear[0] ? 0 : 30)
                    .matchedGeometryEffect(id: "mask\(course.index)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 16) {
                    Text("Credit Score 101")
                        .font(.title).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)
                        .matchedGeometryEffect(id: "Credit Score 101", in: namespace)
                    
                    Text("A beginner's guide to credit".uppercased())
                        .font(.footnote).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                        .matchedGeometryEffect(id: "A beginner's guide to credit", in: namespace)
                    
                    Text("What's a credit score and why is it important?")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                        .matchedGeometryEffect(id: "description\(course.index)", in: namespace)
                }
                .padding(20)
                .padding(.vertical, 10)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .cornerRadius(30)
                        .blur(radius: 30)
                        .matchedGeometryEffect(id: "blur\(course.index)", in: namespace)
                        .opacity(appear[0] ? 0 : 1)
                )
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .backgroundStyle(cornerRadius: 30)
                        .opacity(appear[0] ? 1 : 0)
                )
                .offset(y: scrollY > 0 ? -scrollY * 1.8 : 0)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: 100)
                .padding(20)
            )
        }
        .frame(height: 500)
    }
    
    
    
    var sectionsSection: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Group {
                    Text("Your credit score is a 3 digit number that represents how trustworthy you are when it comes to borrowing money. It is often used when you are buying or leasing a car, buying a home, or even renting an apartment. A high credit score means that you have proved you are responsible with money.")
                        .padding(.bottom, 10.0)
                    Text("It is composed of 5 different categories:")
                    Text("1. 35% PAYMENT HISTORY")
                    Text("2. 30% AMOUNT YOU OWE")
                    Text("3. 15% LENGTH OF CREDIT HISTORY")
                    Text("4. 10% NEW CREDIT OPENED")
                    Text("5. 10% TYPES OF CREDIT YOU HAVE")
                        .padding(.bottom, 10.0)
                    Text("The best way to improve and maintain a good credit score is to focus on the two factors that impact it the most: payment history and amounts owed. Make sure that you are paying every single bill on time to keep a consistent payment history. Even just one late payment can drastically affect your credit score. The amounts owed category is your debt-to-credit ratio, or your debts divided by the total amount of credit you hold across all your accounts. For example, if you are lent $1000 accross all your credit cards and you spend $50 on one and $100 on the other, your debt-to-credit ratio would be 150/1000 or 15%. Experts recommend keeping your ratio to under 30%, but the lower the better!")
                        .padding(.bottom, 10.0)
                    Text("Applying for a new credit card or loan can actually help increase your credit score because more credit will decrease your debt-to-credit ratio. So it's also important to consider the opposite and how closing an account will affect not only your average credit history length, but also your debt-to-credit ratio.")
                        .padding(.bottom, 10.0)
                    Text("It's important to check your credit score often, especially when you are new to credit. That way, you can get an understanding of how your monthly habits can increase or decrease your score. We recommend using Credit Karma on a monthly basis and Annual Credit Report.com on a yearly basis.")
                }
                .font(.caption.weight(.medium))
                .multilineTextAlignment(.leading)
            }
            .padding(.leading, 10.0)
            Spacer()
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .padding(20)
        .padding(.vertical, 60)
        .sheet(isPresented: $showSection) {
            SectionView(section: $selectedSection)
        }
    }
    
    func close() {
        withAnimation {
            viewState = .zero
        }
        withAnimation(.closeCard.delay(0.2)) {
            model.showDetail = false
            model.selectedCourse = 0
        }
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 100 {
                    withAnimation {
                        viewState = value.translation
                    }
                }
                
                if viewState.width > 120 {
                    close()
                }
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.openCard) {
                        viewState = .zero
                    }
                }
            }
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        withAnimation(.easeIn(duration: 0.1)) {
            appear[0] = false
            appear[1] = false
            appear[2] = false
        }
    }
}

struct SwiftUI_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CreditScoreView(namespace: namespace, course: .constant(courses[0]))
            .environmentObject(Model())
    }
}
