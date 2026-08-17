import SwiftUI
import UIKit

struct ComicReaderView: View {
    var comic: Comic
    
    @State private var numPages = 0
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $numPages){
                ForEach(comic.pages.indices, id: \.self){index in
                    if let image = UIImage(contentsOfFile: comic.pages[index].path){
                        Image(uiImage: image) // comic.pages[index]
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .ignoresSafeArea()
                            .tag(index)
                        
                    }
                }
                
            }//tabview
            .tabViewStyle(.page)
            
            Text("\(numPages + 1) / \(comic.pages.count)")
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.capsule)
            
        }
    }

}


func readComic(name: String) -> [URL] {
    
    let bundle = Bundle.main.resourceURL!
    let search = bundle
        .appendingPathComponent("Comics")
        .appendingPathComponent(name)
  
    do{
        let contents = try FileManager.default.contentsOfDirectory(at: search, includingPropertiesForKeys: nil)
        
        return contents.sorted{
            $0.lastPathComponent.localizedStandardCompare($1.lastPathComponent) == .orderedAscending
        }
        
    }catch{
        print(error)
        return []
    }
}



#Preview {
    ContentView()
}




