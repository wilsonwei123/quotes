//
//  UserQuotesView.swift
//  quotes
//
//  Created by Wilson Wei on 16/04/2025.
//

import SwiftUI

struct UserQuotesView: View {
    @ObservedObject var colorsVM: ColorsViewModel
    @StateObject var userQuotesVM = UserQuotesViewModel()
    @State var showCreateQuoteSheet = false
    @State var authorName: String = UserDefaults.standard.string(forKey: "authorName") ?? ""
    @State var addQuoteContent: String = ""
    @State var characterCount: Int = 0
    var body: some View {
        ZStack {
            colorsVM.colors.mainColor.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("\n")
                    ForEach(userQuotesVM.getUserQuotes, id: \.self) {quote in
                        HStack {
                            Text("\(quote)\n")
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                userQuotesVM.removeUserQuote(quote: quote)
                            }, label: {
                                Image(systemName: "xmark")
                                    .padding(.leading, 22.5)
                            })
                        }
                        .frame(maxWidth: 350)
                    }
                }
                Button(action: {
                    withAnimation {
                        showCreateQuoteSheet = true
                    }
                }, label: {
                    BlueButtonView(text: "Add quote")
                        .padding()
                })
            }
            .blur(radius: showCreateQuoteSheet ? 10 : 0)
            if showCreateQuoteSheet {
                VStack {
                    Text("Add a quote")
                        .font(.title2)
                        .bold()
                    TextField("Author/your name", text: $authorName)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundStyle(.black)
                    Text("Quote")
                        .font(.title3)
                        .bold()
                    TextEditor(text: $addQuoteContent)
                        .frame(maxWidth: 180, maxHeight: 220)
                        .foregroundStyle(.black)
                        .scrollContentBackground(.hidden)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    Text("\(characterCount) characters")
                        .onChange(of: addQuoteContent) {
                            characterCount = addQuoteContent.count
                            if characterCount > 250 {
                                addQuoteContent = String(addQuoteContent.prefix(250))
                            }
                        }
                    HStack {
                        Button(action: {
                            withAnimation {
                                showCreateQuoteSheet = false
                            }
                        }, label: {
                            Text("Cancel")
                                .foregroundStyle(.blue)
                                .underline()
                                .padding()
                        })
                        Spacer()
                        Button(action: {
                            userQuotesVM.addUserQuote(newQuote: "\(addQuoteContent) – \(authorName)")
                                addQuoteContent = ""
                            UserDefaults.standard.set(authorName, forKey: "authorName")
                            withAnimation {
                                showCreateQuoteSheet = false
                            }
                        }, label: {
                            BlueButtonView(text: "Save")
                        })
                    }
                    Spacer()
                }
                .frame(width: 200, height: 500)
            }
        }
        .transition(.opacity)
        .animation(.easeIn(duration: 0.3), value:showCreateQuoteSheet)
        .foregroundStyle(colorsVM.colors.textColor)
        .navigationTitle("My Quotes")
    }
}

#Preview {
    UserQuotesView(colorsVM: ColorsViewModel())
}
