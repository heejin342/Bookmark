//
//  MiniWebViewController.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/28.
//

import UIKit
import WebKit

class MiniWebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var miniWebView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    var webtoonLink : String?

    func loadWebPage(_ url: String){
        let myUrl = URL(string: url )
        if (myUrl != nil){
            let myRequest = URLRequest(url: myUrl!)
            miniWebView.load(myRequest)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        miniWebView.navigationDelegate = self
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadWebPage(webtoonLink!)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
//        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("is loading...")
        
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    
    //로딩이 완료되었을 때 인디케이터를 중지하고 숨김
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("loading finished!")
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        
    
    }
    
    
    //로딩실패시 동작, 마찬가지로 인디케이터를 중지하고 숨김
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("loading failed!")
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    
    @IBAction func stopLoading(_ sender: Any) {
        miniWebView.stopLoading()
    }
    
    @IBAction func reloading(_ sender: Any) {
        miniWebView.reload()
    }
    
    @IBAction func goBack(_ sender: Any) {
       
       dismiss(animated: true, completion: nil)
        
    }
    


}


