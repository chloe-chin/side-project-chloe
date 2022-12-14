import SwiftUI

struct LearnView: View {
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
            
            if model.showDetail {
                detail
            }
            
            ScrollView {
                scrollDetection
                
                Rectangle()
                    .frame(width: 100, height: 150)
                    .opacity(0)
                
                Spacer()
                
//                featured
                
//                Text("Courses".uppercased())
//                    .sectionTitleModifier()
//                    .offset(y: -80)
//                    .accessibilityAddTraits(.isHeader)
//                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .ignoresSafeArea()
                
                if model.showDetail {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(courses) { course in
//                            Rectangle()
//                                .fill(.white)
//                                .frame(height: 300)
//                                .cornerRadius(30)
//                                .shadow(color: Color("Shadow").opacity(0.2), radius: 20, x: 0, y: 10)
//                                .opacity(0.3)
                        }
                    }
                    .padding(.horizontal, 20)
                    .offset(y: -80)
                } else {
                    LazyVGrid(columns: columns, spacing: 20) {
                        course.frame(height: 300)
                    }
                    .padding(.horizontal, 20)
                    .offset(y: -80)
                }
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
    
    var detail: some View {
        ForEach(featuredCourses) { course in
            if course.index == model.selectedCourse {
                CourseView(namespace: namespace, course: .constant(course))
//                QuizView(quizGame: QuizGame())
            }
        }
    }
    
    var course: some View {
        ForEach(featuredCourses) { course in
            CourseItem(namespace: namespace, course: course)
        }
        
    }
    
//    var featured: some View {
//        TabView {
//            GeometryReader { proxy in
//                FeaturedItem()
//                    .cornerRadius(30)
//                    .modifier(OutlineModifier(cornerRadius: 30))
//                    .shadow(color: Color("Shadow").opacity(0.3),
//                            radius: 30, x: 0, y: 30)
//                    .blur(radius: abs(proxy.frame(in: .global).minX) / 40)
//                    .overlay(
//                        Image("Illustration 18")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .offset(x: 32, y: -55)
//                            .frame(height: 230)
//                            .offset(x: proxy.frame(in: .global).minX / 2)
//                    )
//                    .padding(20)
//                    .onTapGesture {
//                        showCourse = true
////                      selectedCourse = course
//                    }
//
//                }
//        }
//        .tabViewStyle(.page(indexDisplayMode: .never))
//        .frame(height: 460)
//        .background(
//            Image("Blob 1")
//
//        )
//        .sheet(isPresented: $showCourse) {
//            CourseView(namespace: namespace, course: $selectedCourse, isAnimated: false)
//        }
//    }
    
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

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
            .environmentObject(Model())
//        QuizView(quizGame: QuizGame())
    }
}

