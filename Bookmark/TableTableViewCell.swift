//
//  TableTableViewCell.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/26.
//

import UIKit

class TableTableViewCell: UITableViewCell {

    @IBOutlet var uiImage: UIImageView!
    @IBOutlet var uiTitle: UILabel!
    @IBOutlet var uiChapter: UILabel!
    @IBOutlet var uiLink: UIButton!
    
    var id: Int = 0
    var ary: BookmarkData!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        
        super.setSelected(selected, animated: animated)
      
        // Configure the view for the selected state
    }
    
    @IBAction func gotoLink(_ sender: Any) {
//        print(id)
//        print(ary.link)

    }
    
}
