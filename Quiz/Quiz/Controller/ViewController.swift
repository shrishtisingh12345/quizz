//
//  ViewController.swift
//  Quiz
//
//  Created by shrishti singh on 13/06/21.
//

import UIKit


class ViewController: UIViewController {
    
    var allquestion = QuestionBanke()
    var pickedans : Bool = false
    var questionno : Int = 0
    var scoreview : Int = 0
    @IBOutlet weak var displayquestion: UILabel!
    
    
    @IBOutlet weak var numberOfQuestion: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var pro: UILabel!
   
   
    
    @IBOutlet weak var score: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstquestion = allquestion.list[0]
        displayquestion.text = firstquestion.questiontext
        score.text = "Score\(scoreview)"
       
        
        
    }

    
    @IBAction func trueorfalse(_ sender: UIButton) {
        
        if sender.tag == 1{
            
            pickedans = true
            
           
        }
        else if sender.tag == 2  {
            pickedans = false
            
        }
        correctselectans()
        
        questionno = questionno + 1
        changequestion()
        
    }
    
   
    func changequestion(){
        if questionno <= 12{
        displayquestion.text = allquestion.list[questionno].questiontext
            UIlabel()
        }
        else{
            let alert = UIAlertController(title: "Well Done", message: "You Have finsiher the code", preferredStyle: .actionSheet)
            let alertaction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.restart()
                }
            alert.addAction(alertaction)
            present(alert, animated: true, completion: nil)
            
            scoreview = 0
            
           
        }
    }
    
    func correctselectans() {
        
        let CorrectAns = allquestion.list[questionno].ans
        if CorrectAns == pickedans{
            let alerrightans =  UIAlertController(title: "You Got It Right", message: "" , preferredStyle: .alert)
            let alertRightAnsAction = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
                self.displayquestion
            }
            alerrightans.addAction(alertRightAnsAction)
            present(alerrightans, animated: true, completion: nil)
            print("you Got It Right")
            
            UIlabel()
        }
        else{
            print("your Ans is wrong")
        }
    }
    
    func restart(){
        questionno = 0
        changequestion()
    }
    
    func UIlabel() {
        scoreview = scoreview + 1
        numberOfQuestion.text = "\(questionno + 1)/13"
        score.text = "Score : \(scoreview)"
        
        pro.text = "\(questionno + 1 ) / 13"
        progressBar.frame.size.width = view.frame.size.width / 13 * CGFloat(questionno)
  
    }
    
}

