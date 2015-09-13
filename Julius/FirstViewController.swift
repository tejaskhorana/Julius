//
//  FirstViewController.swift
//  Julius
//
//  Created by Tejas Khorana on 2015-09-12.
//  Copyright (c) 2015 Tejas Khorana. All rights reserved.
//
import UIKit
import TwitterKit
import Foundation

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //converts tweetTexts into an array that contains all Twitter Statii
        var tweetTexts = [String]()
        if let path = NSBundle.mainBundle().pathForResource("AnnArbor", ofType: "json") {
            let jsonString = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
            let jsonObjects = jsonString?.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
            if let jsonObjects = jsonObjects {
                for jsonObject in jsonObjects {
                    if let data = jsonObject.dataUsingEncoding(NSUTF8StringEncoding) {
                        var error: NSError?
                        let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &error) as? [String: AnyObject]
                        if let json = json {
                            if let text = json["text"] as? String {
                                
                                let currentTextObjects = text.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                                for currentTextObject in currentTextObjects {
                                    tweetTexts.append(currentTextObject.lowercaseString)
                                }
                            } else {
                                println("This tweet has no text")
                            }
                        }
                    }
                }
            }
        }

        
        
        
        var numberTimesEachWord = [String:Int]()
        
        var index = 0
        while(index < tweetTexts.count) {
            if numberTimesEachWord[tweetTexts[index]] > 0 {
                numberTimesEachWord[tweetTexts[index]] = numberTimesEachWord[tweetTexts[index]]! + 1
            } else {
                numberTimesEachWord[tweetTexts[index]] = 1
            }
            index = index + 1
        }
        
        index = 0
        while(index < tweetTexts.count) {
            println(tweetTexts[index])
            index = index + 1
        }
        for (word, numtimes) in numberTimesEachWord {
            print("\(word): \(numtimes)) \n")
        }
        
        var topTen = [String:Int]()
        
        var i = 0
        while(i < 10) {
            var currentMaxWord = "to replace"
            var currentMaxValue = -1
            
                for (word, numtimes) in numberTimesEachWord {
                    if(currentMaxValue < numtimes) {
                        currentMaxValue = numtimes
                        currentMaxWord = word
                    }
                }
            topTen[currentMaxWord] = currentMaxValue
            numberTimesEachWord[currentMaxWord] = 0
            i = i + 1
        }
        
        print("results")
        
        for (word, numtimes) in topTen {
            print("\(word): \(numtimes)) \n")
        }
        
        
        
        let bund = NSBundle.mainBundle()
        let jsonData = NSData(contentsOfFile: bund.pathForResource("AnnArbor", ofType: "json")!, options: .DataReadingMappedIfSafe, error: nil)
        
        var parseError: NSError?
        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(jsonData!,
            options: NSJSONReadingOptions.AllowFragments,
            error:&parseError)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

