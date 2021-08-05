//
//  DetailViewController.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/27.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var lblItem: UILabel!

    var receiveItme = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblItem.text = receiveItme
    
    }
    
    // 메인 뷰에서 item 을 받아오는 함수
    func receiveItem(_ item: String){
        receiveItme = item
    }
    


}
