//
//  ProductTableViewCell.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/28.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet var bookimage: UIImageView!
    @IBOutlet var bookTitle: UILabel!
    @IBOutlet var bookChapter: UILabel!
    
    var bookmarkList: BookmarkData? {
        didSet {
            self.updateUI()
            
        }
    }
    
    func updateUI(){
    
        bookimage?.image = UIImage(named: bookmarkList?.image ?? "")
        bookTitle?.text = bookmarkList?.title
        bookChapter?.text = bookmarkList?.chapter
    
    }
    
    

    
}
