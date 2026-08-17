import SwiftUI
import UIKit

struct ComicReaderView: View {
    var comic: Comic
    var chapter: String
    @State private var numPages = 0
    @State private var pages: [URL] = [] // dynamic load
    
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            TabView(selection: $numPages){
                ForEach(pages.indices, id: \.self){index in
                    if let image = UIImage(contentsOfFile: pages[index].path){
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
            
            Text("\(numPages + 1) / \(pages.count)")
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.capsule)
            
        }
        .onAppear(){
            pages = comic.pages(for: chapter)
        }
    }

}


func readComic(name: String, chapter: String) -> [URL] {
    
    let bundle = Bundle.main.resourceURL!
    let search = bundle
        .appendingPathComponent("Comics")
        .appendingPathComponent(name)
        .appendingPathComponent(chapter)
  
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




