//
//  ContentView.swift
//  TicTacToe
//
//  Created by Shrey Jani on 2025-01-01.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @ObservedObject var TicTac = TicTacModel()

    var body: some View {
        VStack {
            Text("TIC TAC TOE")
                .font(.system(size: 40, weight: .heavy))
            let col = Array(repeating: GridItem(.flexible()), count: 3)
            
            LazyVGrid(columns: col, content: {
                ForEach(0..<9){ i in
                    Button(action: {
                        TicTac.buttonTap(i: i)
                    }, label: {
                        Text(TicTac.buttonLabel(i: i))
                            .frame(width: 100, height: 100)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .font(.system(size: 40, weight: .heavy))
                    })
                    
                }
            })
            .padding(.bottom)
            
            Button(action: {
                TicTac.resetGame()
            },label: {
                Text("Restart Game")
                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .heavy))
                    .clipShape(.capsule)
            })
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
