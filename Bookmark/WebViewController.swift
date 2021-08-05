//
//  WebViewController.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, Search {
        

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myAcitvityIndicator: UIActivityIndicatorView!
    @IBOutlet var lblWarning: UILabel!
    @IBOutlet var lblDomain: UILabel!
    let context = (UIApplication.shared.delegate as! AppDelegate) .persistentContainer.viewContext
    
    var viewController : ViewController?
    var keyword: String?
    var domain: String?
    
    //웹 페이지를 로드하는 함수. 주소를 url 의 인수를 통해 전달해서 웹 페이지를 보여줌
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        if (myUrl != nil){
            let myRequest = URLRequest(url: myUrl!)
            myWebView.load(myRequest)
        }
    }
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        viewController?.delegate = self
        
        // 델리게이트 프로토콜 사용한다고 선언해준거. self 안하면 안됨
        myWebView.navigationDelegate = self


    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let tabbar = tabBarController as! TabBarViewController

        keyword = String(describing: String(tabbar.keyword))
        domain = String(describing: String(tabbar.domain))
                    


                
        if(keyword == ""){
            let htmlString = "<h1> 검색어를 입력하세요 <h1> <p> 기본검색은 네이버이고, 플랫폼 변경을 원하시면 메인 탭에서 변경하새요 </p>"
            myWebView.loadHTMLString(htmlString, baseURL: nil)

//            let encodedUrl = makeStringKoreanEncoded("http://m.comic.naver.com")
//            loadWebPage(encodedUrl)
        }
        

        if (keyword != nil) {
            print("data transfered!")

            var fullUrl = ""
            if (domain == "Naver"){
                fullUrl = "http://m.comic.naver.com/search/result?keyword=" + keyword!
            }
            else if (domain == "Daum"){
                fullUrl = "http://m.webtoon.daum.net/m/webtoon/search?q=" + keyword!
            }
            else if (domain == "Kakao"){
                fullUrl = "https://page.kakao.com/search?word=" + keyword!
            }
            
            
            let encodedUrl = makeStringKoreanEncoded(fullUrl)
            loadWebPage(encodedUrl)

            
            txtUrl.text = String(describing: String(tabbar.keyword))
            lblDomain.text = domain

            lblWarning.isHidden = true

        }
        else {
            lblWarning.isHidden = false
        }
        
//        if (keyword! == "" && domain! == "") {
//            print("!!")ㅂ
//
//            lblWarning.isHidden = false
//            myAcitvityIndicator.isHidden = true
//
//        }

    }
    
    
    
    
    func onChange(){
        return
    }
        
    
    // 웹뷰가 로딩중인것을 확인하고 ->  인디케이터를 실행하고 화면에 나타나게 한다
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("is loading...")
  
        
        myAcitvityIndicator.startAnimating()
        myAcitvityIndicator.isHidden = false
    }
    
    
    //로딩이 완료되었을 때 인디케이터를 중지하고 숨김
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("loading finished!")
        myAcitvityIndicator.stopAnimating()
        myAcitvityIndicator.isHidden = true
        
    
    }
    
    
    //로딩실패시 동작, 마찬가지로 인디케이터를 중지하고 숨김
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("loading failed!")
        myAcitvityIndicator.stopAnimating()
        myAcitvityIndicator.isHidden = true
    }
    
    

    
    func checkUrl(_ url: String) -> String {
        //url 은 입력받은 url
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        
        // http:// 없으면 붙이기
        if !flag{
            strUrl = "http://" + strUrl
        }
        
        return strUrl
    }
    
    
    func makeStringKoreanEncoded(_ string: String) -> String {
        return string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? string
    }

    
    
    @IBAction func btnGotoUrl(_ sender: Any) {
        
        print("data changed!")
        lblWarning.isHidden = true
        
        keyword = txtUrl.text
        
        
        if (keyword != nil) {
            
            var fullUrl = ""

            let model = MyList(context: context)
            let date = NSDate()
            
            model.time = date as Date
            model.word = keyword
            saveContext()
            
            
            if (domain == "Naver"){
                fullUrl = "http://m.comic.naver.com/search/result?keyword=" + keyword!
            }
            else if (domain == "Daum"){
                fullUrl = "http://m.webtoon.daum.net/m/webtoon/search?q=" + keyword!
            }
            else if (domain == "Kakao"){
                fullUrl = "https://page.kakao.com/search?word=" + keyword!
            }
            else{
                fullUrl = "http://m.comic.naver.com/search/result?keyword=" + keyword!
            }
            
            
            let encodedUrl = makeStringKoreanEncoded(fullUrl)
            loadWebPage(encodedUrl)
            txtUrl.text = ""
            

        }
        else {
            lblWarning.isHidden = false
        }
    }
    
    
    
    
    @IBAction func btnLoadHtmlString(_ sender: Any) {
        let htmlString = "<h1> HTML  String <h1> <p> String 변수를 이용한 웹 페이지</p><p><a href='http://www.naver.com'>네이버</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    
    @IBAction func btnLoadHtmlFile(_ sender: Any) {
        
        // 경로변수 생성
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        
        // 경로변수를 이용해 URL 변수 생성
        let myUrl = URL(fileURLWithPath: filePath!)
        
        // 요청변수 생성
        let myRequest = URLRequest(url: myUrl)
        
        // html 파일 로딩
        myWebView.load(myRequest)
        
    }
    
    
    @IBAction func btnStop(_ sender: Any) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: Any) {
        myWebView.reload()
    }
    
    
    @IBAction func btnGoBack(_ sender: Any) {
        myWebView.goBack()
    }
    
    
    @IBAction func btnGoForward(_ sender: Any) {
        myWebView.goForward()
    }
    
    
}

