//
//  ContentView.swift
//  Pokedex
//
//  Created by Joan Wilson Oliveira on 14/02/22.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemon : pokemon.filter({
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    HStack {
                        PokemonImage(imageLink: "\(entry.url)")
                            .padding(.trailing, 20)
                        NavigationLink("\(entry.name)".capitalized, destination: Text ("Imagina que tem mais coisa aqui sobre o/a \(entry.name)"))
                    }
                }
            }
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                    
                    for pokemon in pokemon {
                        //print(pokemon.name)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex do Wilson")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
