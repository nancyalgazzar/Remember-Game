//
//  RememberGameVC.swift
//  RememberGame
//
//  Created by 1234 on 28/07/2024.
//

import UIKit

class RememberGameVC: UIViewController {

    @IBOutlet weak var btn12: UIButton!
    @IBOutlet weak var btn11: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    
    
    var isFirstClicked = false
    var correctMatches = 0
    var firstTag = -1
    var firstValue = ""
    var shapesList = ["strawberry","orange","kiwi","banana","ice-cream","doughnut","strawberry","orange","kiwi","banana","ice-cream","doughnut"]
    override func viewDidLoad() {
        super.viewDidLoad()
        shapesList.shuffle()
        // Do any additional setup after loading the view.
    }
    
     
   
    @IBAction func rememberBtns(_ sender: UIButton) {
        disableAllButtons()
        if !isFirstClicked {
            let index  = sender.tag - 1
            isFirstClicked = true
            firstValue = shapesList[index]
            firstTag = sender.tag
            flipCard(sender: sender)
            
        } else {
            
            if firstTag == sender.tag {
                flipCardBack(sender: sender)
                isFirstClicked = false

            }
            flipCard(sender: sender)
            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                debugPrint(self.firstValue == self.shapesList[sender.tag-1])
                debugPrint(self.firstValue)
                debugPrint(self.shapesList[sender.tag-1])
                self.firstValue == self.shapesList[sender.tag-1] ? self.matching(): self.closeCard(firstTag: self.firstTag, secondTag: sender.tag)
                
                self.isFirstClicked = false

            })
           
        }
        enableAllButtons()
    }
}
extension RememberGameVC{
    private func flipCardBack(sender: UIButton){
        sender.setBackgroundImage(UIImage(named: "questionMark"), for: .normal)
    }
    private func flipCard(sender: UIButton){
        sender.setBackgroundImage(UIImage(named: shapesList[sender.tag-1]), for: .normal)
    }
    private func closeCard(firstTag: Int, secondTag: Int){
        guard let button1 = self.view.viewWithTag(firstTag) as? UIButton, let button2 = self.view.viewWithTag(secondTag) as? UIButton else {
            alertMessage(title: "Error", message: "")
            return
        }
        button1.setBackgroundImage(UIImage(named: "questionMark"), for: .normal)
        button2.setBackgroundImage(UIImage(named: "questionMark"), for: .normal)
    }
    private func matching(){
        correctMatches += 1
        if correctMatches == 6 {
            self.alertMessage(title: "Congratulations", message: "Keep your mind sharp")
            restartGame()
        }else {
            self.alertMessage(title: "Wonderfull", message: "you got it right")
            
        }
        
    }
    private func restartGame(){
        shapesList.shuffle()
        for index in 1...12 {
            if let button = self.view.viewWithTag(index) as? UIButton{
                button.setBackgroundImage(UIImage(named: "questionMark"), for: .normal)
                firstTag = -1
                correctMatches = 0
            }
        }
    }
    private func disableAllButtons(){
        btn1.isEnabled = false
        btn2.isEnabled = false
        btn3.isEnabled = false
        btn4.isEnabled = false
        btn5.isEnabled = false
        btn6.isEnabled = false
        btn7.isEnabled = false
        btn8.isEnabled = false
        btn9.isEnabled = false
        btn10.isEnabled = false
        btn11.isEnabled = false
        btn12.isEnabled = false
    }
    private func enableAllButtons(){
        btn1.isEnabled = true
        btn2.isEnabled = true
        btn3.isEnabled = true
        btn4.isEnabled = true
        btn5.isEnabled = true
        btn6.isEnabled = true
        btn7.isEnabled = true
        btn8.isEnabled = true
        btn9.isEnabled = true
        btn10.isEnabled = true
        btn11.isEnabled = true
        btn12.isEnabled = true
    }
}
