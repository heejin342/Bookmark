//
//  ProductDetailTableViewController.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/28.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {

    @IBOutlet var bookmarkImage: UIImageView!
    @IBOutlet var tfTitle: UITextField!
    @IBOutlet var tfAuthor: UITextField!
    @IBOutlet var tfEpisode: UITextField!
    @IBOutlet var tfPlatform: UITextField!
    @IBOutlet var tfLink: UITextField!
    
    
//    var bookmark: BookmarkData? = BookmarkLineData.getBookmarkLines()[0].bookmarks[0]
    var bookmark: BookmarkData?
    
    var section: Int?
    var row: Int?
    
    override func viewDidLoad() {
        title = "Edit Bookmark"
    
        bookmarkImage.image = UIImage(named: bookmark?.image ?? "")

        
        tfTitle.text = bookmark?.title
        tfAuthor.text = bookmark?.author
        tfEpisode.text = bookmark?.chapter
        tfPlatform.text = bookmark?.platform
        tfLink.text = bookmark?.link
        
        tfTitle.delegate = self
    }
    
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            return indexPath
        } else {
            
            // 선택불가
            return nil
        }
    }
    
    
    @IBAction func btnSave(_ sender: Any) {
    
        bookmark?.title = tfTitle.text!
        bookmark?.chapter = tfEpisode.text!
        bookmark?.platform = tfPlatform.text!
        bookmark?.author = tfAuthor.text!
        bookmark?.link = tfLink.text!
        
        _ = navigationController?.popViewController(animated: true)

    }
    
}


// 키보드 리턴시 해제
extension ProductDetailTableViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension ProductDetailTableViewController{
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        tfTitle.resignFirstResponder()
    }
}
