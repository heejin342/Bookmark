//
//  AlertViewController.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/23.
//

import UIKit

class AlertViewController: UIViewController {


    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true
    
    
    @IBOutlet var lampImg: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        lampImg.image = imgOn
    }
    

    // 전구에 불키는 함수
    @IBAction func btnLampOn(_ sender: Any) {
    
        if(isLampOn == true){
            
            //경고문구
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 켜저있는 상테입니다", preferredStyle: UIAlertController.Style.alert)
            
            //OK 버튼 -> 아무런 동작을 하지 않아 핸들러를 nil 로 설정
            let onAction = UIAlertAction(title: "네 알겠습니다", style: UIAlertAction.Style.default , handler: nil)
            
            //alert 만듬
            lampOnAlert.addAction(onAction)
            
            //만든 alert를 띄움, present 메서드 이용
            present(lampOnAlert, animated: true, completion: nil)
            
            
        } else{
            
            lampImg.image = imgOn
            isLampOn = true
        }
    
    }
    
    
    
    @IBAction func btnLampOff(_ sender: Any) {
    
        // if(isLampOn == true) 와 같음
        if isLampOn{
            
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            // 핸들러에 들어있는 함수가 익명함수 ( 클로저)
            // in 안에 실행구문을 쓴다
            // Action 이 파라미터 타입임
            // (Action:타입) in 에서 타입을 알면 (Action), 이때는 괄호가 생략 가능
            // 즉,클로저는 { 매개변수 in 실행구문}
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { ACTION in
                self.lampImg.image = self.imgOff
                self.isLampOn = false})
            
            let calcelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(calcelAction)
            
            present(lampOffAlert, animated: true , completion: nil)
        }
        
    }
    
    
    
    @IBAction func btnLampRemove(_ sender: Any) {
        
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끌게요", style: UIAlertAction.Style.default, handler: { ACTION in
            self.lampImg.image = self.imgOff
            self.isLampOn = false})
    
        let onAction = UIAlertAction(title: "아니오, 켤게요", style: UIAlertAction.Style.default, handler: { ACTION in
            self.lampImg.image = self.imgOn
            self.isLampOn = true })

        
        // destructive 스타일은 빨간색글씨임
        let removeAction = UIAlertAction(title: "네" , style: UIAlertAction.Style.destructive, handler: { ACTION in
            self.lampImg.image = self.imgRemove
            self.isLampOn = false})

    
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)

    
        present(lampRemoveAlert, animated: true, completion: nil)
    
    }

}
