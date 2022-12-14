import SwiftUI

struct CreditScoreInfo: View {
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
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
    }
}

struct CreditScoreInfo_Previews: PreviewProvider {
    static var previews: some View {
        CreditScoreInfo()
    }
}

