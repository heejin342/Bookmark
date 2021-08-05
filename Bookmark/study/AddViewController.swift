//
//  AddViewController.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/27.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: Any) {
        items.append(tfAddItem.text!)
        itemsImageFile.append("4.jpg")
        
        //텍스트 필드의 내용을 지운다
        tfAddItem.text = ""
        
        //루트 뷰 컨트롤러 == 테이블 뷰로 돌아간다
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
