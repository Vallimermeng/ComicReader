import SwiftUI

struct Comic {
    var name: String
    var cover: ImageResource
    var previewChapters: [String]? = nil

    func chapters() -> [String] {
        if let previewChapters {
            return previewChapters
        }

        return readChapters(name: name)
    }

    func pages(for chapterTitle: String) -> [URL] {
        return readComic(name: name, chapter: chapterTitle)
    }
}
