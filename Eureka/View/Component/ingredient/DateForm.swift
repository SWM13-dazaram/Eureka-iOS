//
//  IngredientDateForm.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/07.
//

import SwiftUI

struct DateForm: View {
    let title: String
    let range: PartialRangeFrom<Date>
    @Binding var date: Date
    
    var body: some View{
        HStack{
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 14))
            Spacer()
            DatePicker("", selection: $date, in: range, displayedComponents: .date)
                .labelsHidden()
                .accentColor(.appGreen)
        }
    }
}
