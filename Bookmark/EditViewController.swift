//
//  EditViewController.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/26.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet var tftitle: UITextField!
    @IBOutlet var tfAuthor: UITextField!
    @IBOutlet var tfChapter: UITextField!
    @IBOutlet var tfPlatform: UITextField!
    @IBOutlet var tfLink: UITextField!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

 
    @IBAction func btnAdd(_ sender: Any) {
        
        if ( tfPlatform.text! == "Naver" ){
            bookLines[0].bookmarks.append(BookmarkData(id: bookLines[0].bookmarks.count, image: "신의탑4.png", title: tftitle.text! , chapter: tfChapter.text!, link: "httpslink: ://m.comic.naver.com/webtoon/detail?titleId=183559&no=1", author: tfAuthor.text!, platform: tfPlatform.text!))
        }
        
        else if ( tfPlatform.text! == "Daum" ){
            bookLines[1].bookmarks.append(BookmarkData(id: bookLines[0].bookmarks.count, image: "신의탑4.png", title: tftitle.text! , chapter: tfChapter.text!, link: "httpslink: ://m.comic.naver.com/webtoon/detail?titleId=183559&no=1", author: tfAuthor.text!, platform: tfPlatform.text!))
        }
        
        else if ( tfPlatform.text! == "Kakao" ){
            bookLines[2].bookmarks.append(BookmarkData(id: bookLines[0].bookmarks.count, image: "신의탑4.png", title: tftitle.text! , chapter: tfChapter.text!, link: "httpslink: ://m.comic.naver.com/webtoon/detail?titleId=183559&no=1", author: tfAuthor.text!, platform: tfPlatform.text!))
        } else{
            
            let selectAlert = UIAlertController(title: "",  message: "그 플랫폼은 추가 예정입니다", preferredStyle: UIAlertController.Style.alert)
            
            //OK 버튼 -> 아무런 동작을 하지 않아 핸들러를 nil 로 설정
            let onAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default , handler: nil)
            
            //alert 만듬
            selectAlert.addAction(onAction)
            
            //만든 alert를 띄움, present 메서드 이용
            present(selectAlert, animated: true, completion: nil)

            
        }
        

        tftitle.text = ""
        tfAuthor.text = ""
        tfChapter.text = ""
        tfPlatform.text = ""
        tfLink.text = ""
        
        
        //루트 뷰 컨트롤러 == 테이블 뷰로 돌아간다
        _ = navigationController?.popViewController(animated: true)

    }

}



