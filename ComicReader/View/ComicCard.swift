//
//  ComicCard.swift
//  ComicReader
//
//  Created by Петя on 27.09.2026.
//

import SwiftUI

struct ComicCard: View {
        
    var comic: Comic
    var isFavoritesView: Bool
    
    var viewModel: FavoritesViewModel
    
    var body: some View {
        
        HStack{
            VStack{
                Image(comic.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 300)
                
                    Text(comic.name)
                    .foregroundStyle(Color(.white))
                    .fontWeight(.black)
                
                
                if(!isFavoritesView){
                    Button("Добавить в избранное"){
                        
                        viewModel.addFavorites(name: comic.name)
                        
                    }
                    .font(.system(.body, design: .rounded).weight(.semibold))
                    .foregroundStyle(.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .background(.cyan)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            
                else{
                    Button("Удалить из избранного"){
                        viewModel.deleteFavorites(name: comic.name)
                        
                    }
                    .font(.system(.body, design: .rounded).weight(.semibold))
                    .foregroundStyle(.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .background(.cyan)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                    
                NavigationLink(destination: ChapterView(comic: comic)){
                    Text("Читать")
                        .font(.system(.headline, design: .rounded).weight(.bold))
                        .foregroundStyle(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                    
                
            }//vstack
            
            .padding(.bottom, 20)
            
            .background(.ultraThinMaterial)
        }//hstack
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        
        
    }
    

}

#Preview("iPhone 13") {
    ContentView()
}
