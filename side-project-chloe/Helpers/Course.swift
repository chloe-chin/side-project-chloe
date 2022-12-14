import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
//    var logo: String
}

var courses = [
    Course(index: 1, title: "Finance Tracker", subtitle: "Your Expenses", text: "Track all of your daily purchases here", image: "Illustration 18", background: "Blob 1"),
//    Course(index: 2, title: "UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 3", background: "Background 4"),
//    Course(index: 3, title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", background: "Background 1"),
//    Course(index: 4, title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Background 2")
]

var featuredCourses = [
    Course(index: 1, title: "Budgeting 101", subtitle: "A Beginner's Guide to Budgeting", text: "Learn how to create and stick to a budget", image: "Illustration 11", background: "Background 1"),
    Course(index: 2, title: "Credit Score 101", subtitle: "A Beginner's Guide to Credit", text: "Everything you need to know about credit scores", image: "Illustration 13", background: "Background 3"),
    Course(index: 3, title: "Savings 101", subtitle: "A Beginner's Guide to Savings", text: "What is an emergency fund and why do you need it?", image: "Illustration 7", background: "Background 4"),
    Course(index: 4, title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", background: "Background 1")
]

