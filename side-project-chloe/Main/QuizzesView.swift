import SwiftUI

struct QuizzesView: View {
    var columns = [GridItem(.adaptive(minimum: 300), spacing: 20)]
    
    @State var show = false
    @State var showStatusBar = true
    @State var showCourse = false
    @State var selectedCourse: Course = courses[0]
    @State var contentHasScrolled = false
    
    @EnvironmentObject var model: Model
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                Rectangle()
                    .frame(width: 100, height: 50)
                    .opacity(0)
                
                featured
                
                Text("more quizzes coming soon!".uppercased())
                    .sectionTitleModifier()
                    .offset(y: -80)
                    .accessibilityAddTraits(.isHeader)
            }
            .coordinateSpace(name: "scroll")
        }
        .onChange(of: model.showDetail) { value in
            withAnimation {
                model.showTab.toggle()
                model.showNav.toggle()
                showStatusBar.toggle()
            }
        }
        .overlay(NavigationBar(title: "Quizzes", contentHasScrolled: $contentHasScrolled))
        .statusBar(hidden: !showStatusBar)
    }
    
    var featured: some View {
        TabView {
            GeometryReader { proxy in
                QuizItem()
                    .cornerRadius(30)
                    .modifier(OutlineModifier(cornerRadius: 30))
                    .shadow(color: Color("Shadow").opacity(0.3),
                            radius: 30, x: 0, y: 30)
                    .blur(radius: abs(proxy.frame(in: .global).minX) / 40)
                    .overlay(
                        Image("Illustration 12")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(x: 60, y: -90)
                            .frame(height: 230)
                            .offset(x: proxy.frame(in: .global).minX / 2)
                    )
                    .padding(20)
                    .onTapGesture {
                        showCourse = true
                    }
                        
                }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 460)
        .background(
            Image("Blob 1")
            
        )
        .sheet(isPresented: $showCourse) {
            QuizView(quizGame: QuizGame())
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    contentHasScrolled = true
                } else {
                    contentHasScrolled = false
                }
            }
        }
    }
}

struct Quizzes_Previews: PreviewProvider {
    static var previews: some View {
        QuizzesView()
            .environmentObject(Model())
    }
}


