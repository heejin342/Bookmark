//
//  RecordViewController.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/27.
//

import UIKit
import CoreData

class RecordViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var txtInput: UITextField!
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet var searchBar: UISearchBar!
    
    
    var stringArr = [String]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var result:[MyList] = []
    
    var searchWord = [MyList]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetch()
        tableView.reloadData()
    }
    
    
    func fetch(){
        
        let request = NSFetchRequest<MyList>(entityName: "MyList")
        
        do{
           result = try context.fetch(request)
    
        }catch{
        
            print(error)
        }
    }
    
    
    @IBAction func onClickAddButton(_ sender: Any) {
//        이건 추가했을때 기능이 들어간 버튼
//        if let txt = txtInput.text, !txt.isEmpty{
//            self.stringArr.insert(txt, at:0)
//            tableView.beginUpdates()
//            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
//            tableView.endUpdates()
//            txtInput.text = nil
//        }
    }
    
    
    @IBAction func onClickDelete(_ sender: UIButton) {
        
        let point = sender.convert(CGPoint.zero, to:tableView)
        guard let indexpath = tableView.indexPathForRow(at: point)
        else{ return }
        
//        stringArr.remove(at: indexpath.row)
        tableView.beginUpdates()


        self.context.delete(self.result[indexpath.row])
        saveContext()
        self.fetch()
        
        tableView.deleteRows(at: [indexpath], with: .automatic)
        // 원래거
        //  tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left

        tableView.endUpdates()

    }
    
}



extension RecordViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return stringArr.count
        if(searching){
            return searchWord.count
        }else{
            return result.count

        }
    }

        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {return UITableViewCell()}
            
                
        if searching {
            cell.lblName?.text = searchWord[indexPath.row].word
        } else{
            
            let rslt = result[indexPath.row]
            // cell.lblName.text = stringArr[indexPath.row]
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            let text = rslt.word! + "  /  " + dateFormatter.string(from: rslt.time!)
             
            cell.lblName.text = text

            // cell.lblName?.text = result[indexPath.row].word
        }
        
        return cell
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "") {
            _,_,_ in
            
            self.context.delete(self.result[indexPath.row])
            
            saveContext()
            self.fetch()
            
            tableView.deleteRows(at: [indexPath],with: .automatic)
        }
        
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        
        return swipe
    }
    
}

extension RecordViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchWord = result.filter({ $0.word!.lowercased().prefix(searchText.count) == searchText.lowercased() })
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        print("!")
        searchBar.text = ""
        tableView.reloadData()

    }
}


