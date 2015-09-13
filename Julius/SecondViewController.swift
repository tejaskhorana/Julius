//
//  SecondViewController.swift
//  Julius
//
//  Created by Tejas Khorana on 2015-09-12.
//  Copyright (c) 2015 Tejas Khorana. All rights reserved.
//

import UIKit
import Social

class SecondViewController: UIViewController {

    let urlPath = "https://stream.twitter.com/1.1/statuses/filter.json"
    let addOn = "?track=twitter&locations=-122.75,36.8,-121.75,37.8"
    
    @IBOutlet weak var activityLoading: UIActivityIndicatorView!

    @IBOutlet weak var trendsButton: UIButton!
    
    @IBAction func trendsButtonPressed(sender: UIButton) {
        /*
        trendsButton.hidden = true;
        activityLoading.startAnimating();
        activityLoading.hidden = false;
        */
        
        // 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trendsButton.hidden = false;
        activityLoading.hidden = true;
        let finalpath = urlPath + addOn;
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

