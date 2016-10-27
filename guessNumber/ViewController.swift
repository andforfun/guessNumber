//
//  ViewController.swift
//  guessNumber
//
//  Created by 李小明 on 2016/10/26.
//  Copyright © 2016年 李小明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var enterNumber: UITextField!
    @IBOutlet weak var range: UILabel!
    @IBOutlet weak var haveChance: UILabel!
    @IBOutlet weak var answer: UILabel!
    
    @IBOutlet weak var againButton: UIButton!
    var chanceNumbr:Int = 6
    var randomNumber:Int = Int(arc4random_uniform(100))
    @IBAction func enterButton(_ sender: UIButton) {
        
        if sender.currentTitle == "再一次？"{
             chanceNumbr = 6
             randomNumber = Int(arc4random_uniform(100))
             sender.setTitle("確認", for: .normal)
             haveChance.text = "您還有6次機會"
             answer.text = ""
             range.text = ""
             enterNumber.text = ""
             return
        }
        
        if chanceNumbr == 0 {
            return
        }
        if enterNumber.text == ""{
             range.text = "您還未輸入值喔"
            return
        }
        if Int(enterNumber.text!) == nil{
            range.text = "只能輸入數字喔"
            return
        }
        let getEnterNumber:Int = Int(enterNumber.text!)!
        if getEnterNumber < 0 || getEnterNumber > 100{
            range.text = "您輸入的值超過範圍喔"
            return
        }
        if getEnterNumber > randomNumber{
            range.text = "您的數字太大"
            answer.text = "答錯"
            if getEnterNumber - randomNumber <= 10{
                range.text = "接近摟 只大一點點"
            }
        }else if getEnterNumber < randomNumber{
            range.text = "您的數字太小"
            answer.text = "答錯"
            if randomNumber - getEnterNumber <= 10{
                range.text = "接近摟 只小一點點"
            }
        }
        else{
            range.text = "命中"
            answer.text = "邦邦邦 你答對啦"
            sender.setTitle("再一次？", for: .normal)
            return
        }
        chanceNumbr -= 1
        if chanceNumbr == 0{
            range.text = "答案是\(randomNumber)"
            sender.setTitle("再一次？", for: .normal)
        }
        if chanceNumbr == 0{
            haveChance.text = "恭喜 失敗~~"
        }else
        {
        haveChance.text = "您還剩下\(chanceNumbr)次機會"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

