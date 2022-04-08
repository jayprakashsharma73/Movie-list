//
//  ContentView.swift
//  Movie list
//
//  Created by Jay Prakash Sharma on 08/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var movieListVM = MovieListViewModel()
    @State private var searchText: String = ""
    
    init() {
           self._movieListVM = StateObject(wrappedValue: MovieListViewModel())
       } 
    
    var body: some View {
        NavigationView {
            List(movieListVM.movies, id: \.imdbId) { movie in
                HStack {
                    AsyncImage(url: movie.poster
                               , content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                    }, placeholder: {
                        ProgressView()
                    })
                    Text(movie.title)
                }
            }.listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText) { value in
                    Task {
                        if !value.isEmpty &&  value.count > 3 {
                            await movieListVM.search(name: value)
                        } else {
                            movieListVM.movies.removeAll()
                        }
                    }
                }
            
                .navigationTitle("Movies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
