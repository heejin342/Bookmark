//
//  ViewController.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/23.
//

import UIKit

protocol Search{
    func onChange()
}


var bookLines: [BookmarkLineData] = BookmarkLineData.getBookmarkLines()

var selectedProduct: BookmarkData?

class ViewController: UIViewController {
   
    
    var delegate : Search?
    
    

    @IBOutlet var lblSelect: UIButton!
    @IBOutlet var tfSearch: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var domains: [UIButton]!
    @IBOutlet var editButton: UIBarButtonItem!
    

    var pickerView = UIPickerView()
    
    var selectedDomain: String = ""


    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.estimatedRowHeight = tableView.rowHeight
//        tableView.rowHeight = UITableView.automaticDimension
        

        
//        let bookCell = UINib(nibName: "TableTableViewCell" , bundle: nil)
//        self.tableView.register(bookCell, forCellReuseIdentifier: "bookCell")

    
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()

    }

    
    @IBAction func handleSelect(_ sender: Any) {
        domains.forEach{ button in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    enum Domains: String {
        
        case naver = "Naver"
        case daum = "Daum"
        case kakao = "Kakao"
    }
    
    @IBAction func domainTapped(_ sender: UIButton) {
                
        selectedDomain = sender.titleLabel!.text!
       
        lblSelect.titleLabel!.text = sender.titleLabel!.text!
        
        domains.forEach{ button in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    
        guard let title = sender.currentTitle,
                let select = Domains(rawValue: title)
        else{
            return
        }
        
        switch select {
            case .naver:
                print("naver")
            case .daum:
                print("daum")
            case .kakao:
                print("Kakao")
        }

    }


    @IBAction func searchTapped(_ sender: Any) {
    
        let data: String = tfSearch.text!
        
        
        let tabbar = tabBarController as! TabBarViewController
        
        if(selectedDomain != ""){
            
            if (data != ""){
                tabbar.keyword = String(data)
                tabbar.domain = selectedDomain
                tabBarController?.selectedIndex = 1
                tfSearch.text = ""
            }
            else {
                let inputAlert = UIAlertController(title: "검색어를 입력하세요",  message: "", preferredStyle: UIAlertController.Style.alert)
                
                //OK 버튼 -> 아무런 동작을 하지 않아 핸들러를 nil 로 설정
                let onAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default , handler: nil)
                
                //alert 만듬
                inputAlert.addAction(onAction)
                
                //만든 alert를 띄움, present 메서드 이용
                present(inputAlert, animated: true, completion: nil)
            }
                                
        }
        else {
            
            let selectAlert = UIAlertController(title: "검색할 플랫폼을 선택하세요",  message: "", preferredStyle: UIAlertController.Style.alert)
            
            //OK 버튼 -> 아무런 동작을 하지 않아 핸들러를 nil 로 설정
            let onAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default , handler: nil)
            
            //alert 만듬
            selectAlert.addAction(onAction)
            
            //만든 alert를 띄움, present 메서드 이용
            present(selectAlert, animated: true, completion: nil)

        }

    }
    
    @IBAction func btnWatch(_ sender: Any)
    {
       
        let miniWebTVC = storyboard?.instantiateViewController(withIdentifier: "MiniWebViewController") as! MiniWebViewController

        let contentView = (sender as AnyObject).superview
        
        let cell = contentView??.superview as! UITableViewCell
        
        let indexPath = tableView.indexPath(for: cell)
        
        let section = indexPath![0]
        let row = indexPath![1]
        
        miniWebTVC.webtoonLink = bookLines[section].bookmarks[row].link
        
        self.present(miniWebTVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func btnEdit(_ sender: Any) {
        if self.tableView.isEditing {
            self.tableView.isEditing = false
            self.editButton.title = "Edit"
        } else {
            self.tableView.isEditing = true
            self.editButton.title = "Done"
        }
    }
        

}

//extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return domains.count
//    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return domains[row]
//    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        tfSearch.text = domains[row]
//
//        tfSearch.resignFirstResponder()
//    }
    

extension ViewController : UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return bookLines.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookLines[section].bookmarks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! ProductTableViewCell
        //  let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! TableTableViewCell

        let bookLine = bookLines[indexPath.section]
        let bookmarkList = bookLine.bookmarks
        let bookmark = bookmarkList[indexPath.row]

        
        
        // 이게 아래를 대체
        cell.bookmarkList = bookmark
        
            
        return cell

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        let bookmarkLine = bookLines[section]
       
        return bookmarkLine.name
    }
    

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let bookToMove = bookLines[sourceIndexPath.section].bookmarks[sourceIndexPath.row]
        
        bookLines[destinationIndexPath.section].bookmarks.insert(bookToMove, at: destinationIndexPath.row)
        
        bookLines[sourceIndexPath.section].bookmarks.remove(at: sourceIndexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            let bookLine = bookLines[indexPath.section]
            bookLine.bookmarks.remove(at: (indexPath as NSIndexPath).row)

            // tableView.reloadData()

            tableView.deleteRows(at: [indexPath], with: .fade)

        } else if editingStyle == .insert {

        }
    }

  
    

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let productDetailTVC = storyboard?.instantiateViewController(withIdentifier: "ProductDetailTableViewController") as! ProductDetailTableViewController
         
         
        let bookLine = bookLines[indexPath.section]
        let bookmark = bookLine.bookmarks[indexPath.row]

        selectedProduct = bookmark

         productDetailTVC.bookmark = selectedProduct
         
         productDetailTVC.section = indexPath.section
         productDetailTVC.row = indexPath.row
        
         self.navigationController?.pushViewController(productDetailTVC, animated: true)

    }
        
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        tableView.rowHeight = 80
//
//
//
//        // 셀을 가져오는데 nill 이면 셀에 UITableViewCell 을 넣어라
//        // nil 방지 -> guard. nill 일때는 else 문이 리턴된다
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell
//
//        let friendData : FriendData = friendList[indexPath.row]
//
//
//        //위 델리게이트 메서드를 이용해 이제 cell 의 객체들이 사용될 수 있음
//        //위의 배열 내용으로 초기화했음 , uiSwitch 는 false로 초기화 해도 되는데, 나는 그냥 배열 값으로 넣어줌
//        //셀에 각 데이터들을 전달한다
//        cell.uiName.text = friendData.name
//        cell.uiProfileMessage.text = friendData.profileMessage
//        cell.uiSwitch.isOn = friendData.isOn
//        cell.friend = friendData
//
//        return cell
//    }
}
