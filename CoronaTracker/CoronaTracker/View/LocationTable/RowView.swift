//
//  RowView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/14/21.
//

import SwiftUI
import SwiftFlags

struct RowView: View {
    let rowContent: RowContent
    let id_row_name: String
    let defaultFlag = "🇲🇽"
    
    init(rowContent: RowContent){
        self.rowContent = rowContent
        self.id_row_name = "id_row_"+rowContent.titlePlaholder.replacingOccurrences(of: " ", with: "_")
    }
    
    var body: some View {
        HStack{
            HStack{
                Text(SwiftFlags.flag(for: rowContent.titlePlaholder) ?? defaultFlag)
                    .font(.system(size: 30))
                    .accessibility(identifier: "id_row_flag")
                Text(rowContent.titlePlaholder)
                    .modifier(HeaderStyle())
                    .accessibility(identifier: id_row_name)
            }
            Spacer()
            StatsView(
                confirmed: rowContent.confirmedPlaholder, deaths: rowContent.deathsPlaceholder, recovered: rowContent.recoveredPlaceholder
            )
        }
        .modifier(CountryRowStyle())
        
    }
}


struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            RowView(rowContent: testProvinceRow)
            RowView(rowContent: testCountryRow)
        }
    }
}
