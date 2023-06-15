//
//  SearchView.swift
//  MLMini
//

import SwiftUI

struct SearchView: View {
    var viewModel: SearchViewViewModel
    @EnvironmentObject var parent: SearchViewControllerSwiftUIBridge
    @State var textFieldText: String = ""
    @FocusState private var focusedField: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Spacer()
            SearchViewTopImage()
            Spacer()
            Spacer()
            Group {
                MLMiniTextField(text: $textFieldText, placeholder: "Search on Mercadolibre")
                    .focused($focusedField)
                    .padding(.bottom, 8)
                PrimaryButton(label: "Buscar") {
                    searchForItems()
                }
            }
            .onSubmit {
                searchForItems()
            }
            Spacer()
        }
        .padding(.horizontal, 20.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("activeYellow"))
        .onTapGesture {
            focusedField = false
        }
    }
    
    private func searchForItems() {
        focusedField = false
        viewModel.onSearchButtonTap(textToSearch: textFieldText)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewBuilder().getView(forController: UIViewController())
    }
}

private struct SearchViewTopImage: View {
    var body: some View {
        MLImage.SUImeliLogo
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 100)
    }
}
