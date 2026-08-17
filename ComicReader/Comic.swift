import SwiftUI

struct Comic{
    var name: String
    var cover: ImageResource
    var chapter: [String]
    func pages(for chapterTitle: String) -> [URL] {
        return readComic(name: name, chapter: chapterTitle)
    }
}
