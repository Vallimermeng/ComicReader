
import SwiftUI

struct ContentView: View {
    
    let comics = [
        Comic(
            name: "Spider-Man",
            cover: .SpiderMan.cover,
            pages: readComic(name: "Spider-Man")
        ),
        
        Comic(name: "Wolverine",
              cover: .Wolverine.origin0100,
              pages: readComic(name: "Wolverine")
        )
    ]
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                Text("Доступные комиксы")
                
                ForEach(comics, id: \.name){ comic in
                    VStack{
                        Image(comic.cover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 300)
                        Text(comic.name)
                        NavigationLink(destination: ComicReaderView(comic: comic)){
                            Text("Читать")
                                .font(.headline)
                        }
                        
                    }
                }

            }//vstack
            
        }//navig
        
    }
}

#Preview {
    ContentView()
}
