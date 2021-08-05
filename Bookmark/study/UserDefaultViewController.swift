//
//  UserDefaultViewController.swift
//  Bookmark
//
//  Created by 김희진 on 2021/07/29.
//

import UIKit

class UserDefaultViewController: UIViewController {

    @IBOutlet var onOffSwitcj: UISwitch!
    @IBOutlet var onOffLabel: UILabel!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    
    let userDefualts = UserDefaults.standard
    
    let ON_OFF_KEY = "onOffKey"
    let THEME_KEY = "themeKey"
    let DARK_THEME = "darkTheme"
    let LIGHT_THEME = "LightTheme"
    let RED_THEME = "redTheme"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSwitchState()
        updateTheme()
    }
    
    func checkSwitchState(){
        if(userDefualts.bool(forKey: ON_OFF_KEY)){
            onOffSwitcj.setOn(true, animated: false)
            onOffLabel.text = "ON"
        }else {
            onOffSwitcj.setOn(false, animated: false)
            onOffLabel.text = "OFF"
        }
    }
    
    func updateTheme(){
    
        let theme = userDefualts.string(forKey: THEME_KEY)
        
        if(theme == LIGHT_THEME){
            segmentControl.selectedSegmentIndex = 0
            view.backgroundColor = UIColor.white
        }
        else if(theme == DARK_THEME){
            segmentControl.selectedSegmentIndex = 1
            view.backgroundColor = UIColor.gray
        }
        if(theme == RED_THEME){
            segmentControl.selectedSegmentIndex = 2
            view.backgroundColor = UIColor.red
        }
        
        
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex{
        case 0:
            userDefualts.set(LIGHT_THEME, forKey: THEME_KEY)
        case 1:
            userDefualts.set(DARK_THEME, forKey: THEME_KEY)
        case 2:
            userDefualts.set(RED_THEME, forKey: THEME_KEY)
        default:
            userDefualts.set(LIGHT_THEME, forKey: THEME_KEY)
        }
        updateTheme()

    }
    
    @IBAction func swithChanged(_ sender: Any) {
        if(onOffSwitcj.isOn){
            userDefualts.set(true, forKey: ON_OFF_KEY)
            onOffLabel.text = "ON"
        }
        else {
            userDefualts.set(true, forKey: ON_OFF_KEY)
            onOffLabel.text = "OFF"
        }

    }

}
