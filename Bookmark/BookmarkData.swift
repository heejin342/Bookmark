//
//  BookmarkData.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/26.
//

import Foundation
import UIKit

class BookmarkData {

    var id : Int
    var image : String
    var title : String
    var chapter : String
    var link : String
    var author : String
    var platform : String

    init(id: Int, image: String, title: String, chapter : String, link : String, author : String, platform: String) {
        self.id = id
        self.image = image
        self.title = title
        self.chapter = chapter
        self.link = link
        self.author = author
        self.platform = platform
    }
}
