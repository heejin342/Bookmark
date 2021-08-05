//
//  BookmarkLineData.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/28.
//

import UIKit

class BookmarkLineData {

    var name : String
    var bookmarks: [BookmarkData]
    
    init(name : String, includeBookmarks : [BookmarkData] ) {

        self.name = name
        self.bookmarks = includeBookmarks
    }
    
    class func getBookmarkLines() -> [BookmarkLineData]{
        return [Naver(), Daum(), Kakao()]
    }
    
    class func Naver() -> BookmarkLineData{
        var bookmarks = [BookmarkData]()
        
        bookmarks.append(BookmarkData(id: 1, image: "신의탑1.png", title: "신의탑", chapter: "1", link: "https://m.comic.naver.com/webtoon/detail?titleId=183559&no=1", author: "SIU" , platform: "Naver"))
        
        bookmarks.append(BookmarkData(id: 2, image:  "신의탑2.png", title: "신의탑2", chapter: "2", link: "https://m.comic.naver.com/webtoon/detail?titleId=183559&no=2", author: "SIU" , platform: "Naver"))
        
        bookmarks.append(BookmarkData(id: 3, image:  "신의탑3.png", title: "신의탑3", chapter: "3", link: "https://m.comic.naver.com/webtoon/detail?titleId=183559&no=3", author: "SIU" , platform: "Naver"))

        return BookmarkLineData(name: "Naver", includeBookmarks: bookmarks)
    }
    
    
    
    class func Naver(_ id : Int, _ image : String, _ title: String , _ chapter: String , _ link : String , _ author : String, _ Platform : String) -> BookmarkLineData{

        var bookmarks = [BookmarkData]()
                
        bookmarks.append(BookmarkData(id: id , image: image, title: title, chapter: chapter, link: link, author: author , platform: Platform))

        return BookmarkLineData(name: "Naver", includeBookmarks: bookmarks)
    }

    
    
    private class func Daum() -> BookmarkLineData{
        var bookmarks = [BookmarkData]()
        
        bookmarks.append(BookmarkData(id: 4, image: "좋아하면울리는.png", title: "좋아하면울리는", chapter: "1", link: "http://m.webtoon.daum.net/m/webtoon/viewer/26927", author: "SIU" , platform: "Daum"))
       
        return BookmarkLineData(name: "Daum", includeBookmarks: bookmarks)
    }

    
    
    private class func Kakao() -> BookmarkLineData{
        var bookmarks = [BookmarkData]()
        
        bookmarks.append(BookmarkData(id: 5, image:  "칼집의아이1.png", title: "칼집의아이", chapter: "1", link: "https://page.kakao.com/viewer?productId=56554846", author: "SIU" , platform: "Kakao"))
       
        return BookmarkLineData(name: "Kakao", includeBookmarks: bookmarks)
    }

    
}


