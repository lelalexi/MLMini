//
//  ProductDetailTopRow.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 27/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ProductDetailTopRow: View {
    @Binding var isLoading: Bool
    var itemCondition: String
    var soldItems: String
    var publicationTitle: String
    private var itemConditionAndSoldItems: String { itemCondition + " | " + soldItems + " " + MLLocalizables.ProductDetailView.soldItemsLabel }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4.0, content: {
            Text(itemConditionAndSoldItems)
                .font(.custom("Avenir-Light", size: 12))
                .foregroundColor(Color.terciaryText)
            Text(publicationTitle)
                .font(.custom("Avenir-Book", size: 16))
                .foregroundColor(Color.primaryText)
        })
        .multilineTextAlignment(.leading)
        .redacted(reason: isLoading ? .placeholder : [])
    }
}

struct ProductDetailTopRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailTopRow(isLoading: .constant(false),
                            itemCondition: "New",
                            soldItems: "15",
                            publicationTitle: "Ops Vw 4k Sensores De Estacionamiento Scirocco Vento Golf")
        .padding(.horizontal, MLSpacings.defaultMargin)
        .previewDevice("iPhone 13 mini")
        .previewLayout(.sizeThatFits)
    }
}
