import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var longtext : String
//    var logo: String
}

var courses = [
    Course(index: 1, title: "Finance Tracker", subtitle: "Your Expenses", text: "Track all of your daily purchases here", image: "Illustration 18", background: "Blob 1", longtext: " "),
]

var featuredCourses = [
    Course(index: 1, title: "Budgeting 101", subtitle: "A Beginner's Guide to Budgeting", text: "Learn how to create and stick to a budget", image: "Illustration 11", background: "Background 1", longtext: "Knowing how to create and maintain a budget that fits for your lifestyle is one of the most important things when it comes to your financial health.\n\nTaking the time to go through your finances helps you:\n1. Identify excessive spending\n2. Determine how much your emergency fund should be\n3. Prepare for upcoming big purchases\n4. Stay within your means so that you’re able to accomplish your financial goals\n\nThis module will explain 4 different types of budgets. Try out the one that you think fits you best.\n\nThe first one is the Traditional Budget. The traditional budget uses the formula -> income - expenses = net income <-. Your net income can be used to pay off debt, set aside for emergencies, or invested. If you want to increase your savings, you have to reduce your expenses.\n\nThe next one is the Zero-based Budget. This one uses the formula -> income - expenses = 0 <-, which means that your savings are treated like an expense. Each month you allocate every single dollar from your income to an expense, whether that be your car payment or holiday gifts. This budget is ideal for people who have a lot of time to budget and want to be as detailed in their spending as possible.\n\nThe third budget is the 50/30/20 Budget. In this budget, your money is split three ways: 50% for needs like rent and groceries, 30% for wants such as new clothes, and 20% for your savings. In order for this budget to work, you have to strictly define the difference between your wants and needs. Things like your Netflix subscription might seem like a need, but you shouldn’t prioritize it over your bills.\n\nHowever, a good thing about this budget is that it can be adjusted for each situation. For example, if you have debt to pay off, you may find it better to change it to 70% needs / 20% wants / 10% savings.\n\nThe last budget is the 80/20 Budget, which is 80% needs and wants and 20% savings. This budget is simple because it doesn’t set strong limits while still ensuring that you’re saving money. However, there is not as much structure in this one as the other budgets and if you’re consistently overspending, it can be harder to identify the areas you need to cut back on.\n\nOverall, a budget shouldn’t be seen as something there to restrict you and prevent you from having fun.\n\nIt should be seen as something that will help you reach your financial goals so that you can have fun and buy the things you want in the future. It can be as complicated or as simple as you want and can be changed overtime as your needs and financial situation evolve. Any budget is better than no budget, so feel free to start small if you’re unsure where to begin."),
    Course(index: 2, title: "Credit Score 101", subtitle: "A Beginner's Guide to Credit", text: "Everything you need to know about credit scores", image: "Illustration 13", background: "Background 3", longtext: "Your credit score is a 3 digit number, ranging from 300 to 850 that represents how trustworthy you are when it comes to borrowing money. It is often used when you are buying or leasing a car, buying a home, or even renting an apartment. A high credit score means that you have proved you are responsible with money.\n\nIt is composed of 5 different categories:\n1. 35% PAYMENT HISTORY\n2. 30% AMOUNT YOU OWE\n3. 15% LENGTH OF CREDIT HISTORY\n4. 10% NEW CREDIT OPENED\n5. 10% TYPES OF CREDIT YOU HAVE\n\nThe best way to improve and maintain a good credit score is to focus on the two factors that impact it the most: payment history and amounts owed. Make sure that you are paying every single bill on time to keep a consistent payment history. Even just one late payment can drastically affect your credit score.\n\nThe amounts owed category is your debt-to-credit ratio, or your debts divided by the total amount of credit you hold across all your accounts. For example, if you are lent $1000 accross all your credit cards and you spend $50 on one and $100 on the other, your debt-to-credit ratio would be 150/1000 or 15%. Experts recommend keeping your ratio to under 30%, but the lower the better!\n\nApplying for a new credit card or loan can actually help increase your credit score because more credit will decrease your debt-to-credit ratio. So it's also important to consider the opposite and how closing an account will affect not only your average credit history length, but also your debt-to-credit ratio.\n\nIt's important to check your credit score often, especially when you are new to credit. That way, you can get an understanding of how your monthly habits can increase or decrease your score. We recommend using Credit Karma on a monthly basis and Annual Credit Report.com on a yearly basis."),
    Course(index: 3, title: "Savings 101", subtitle: "A Beginner's Guide to Savings", text: "What is an emergency fund and why do you need it?", image: "Illustration 7", background: "Background 4", longtext: "Life is full of unexpected events and you never know when you’re going to be hit with a huge expense that you didn’t budget or plan for.\n\nThis is why you need an emergency fund. An emergency fund is like your “financial safety net”. You can take money out of it to pay for something when there is no other choice.\n\nFor example, an emergency fund would come to the rescue if you get into a car crash or if you suddenly lose your job. But, it should not be used when your bank account is low and you want to go out with your friends.\n\nMost financial planners recommend having an emergency fund that can cover 3-6 months of your expenses (rent, car payment, groceries, utilities). If you’re just starting your emergency fund and don’t have any debt, put all of your income after expenses into your emergency fund before you start saving for things like vacation or retirement. If you have debt, use your left over money to try to pay those down as soon as possible, to avoid paying more in interest.\n\nUltimately, when deciding how big of an emergency fund to save up, you want to take a look at your own financial situation and factor in things such as your job security and how much you have in lines of credit. You can also make it more than 3-6 months depending on what you think you’ll need.\n\nOnce you decide how much you want to save up in your emergency fund, you’ll want to start a new checking or savings account that is specifically for your emergency fund and nothing else. Having a separate account will ensure that you don’t easily take money from there when it isn’t an emergency. You can also look into a high yield savings account if you want your emergency fund to collect interest and slowly grow over time.\n\nIt’s important to remember that an emergency fund is not a regular savings account that you should use when you feel like you’ve saved enough money in it or when the money has been in there a long time. You should only dip into it for real emergencies like health issues or losing your job. Hopefully you never have to use your emergency fund, but if you do, make sure to start building it back up right after.\n\nOverall, an emergency fund can save you from having to resort to debt when you don’t have enough money to cover an unexpected expense."),
]

