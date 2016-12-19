//
//  SettingViewController.swift
//  MVC-Repo-Github
//
//  Created by Nghia Tran on 12/17/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    // Count
    @IBOutlet weak var reposCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //
        NotificationCenter.default.addObserver(self, selector: #selector(SettingViewController.reloadSettingViewNotification), name: NSNotification.Name(rawValue: "Reload"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc func reloadSettingViewNotification(sender: Notification) {
        
        let count = sender.userInfo?["count"] as? Int ?? 0
        
        // Reload here
        self.reposCount.text = "\(count)"
    }
}
