//
//  ViewController.swift
//  QuizApp
//
//  Created by user211064 on 3/13/22.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    //array for questions and answers
    var questionList = [Question]()
    var point = Point()
    
    var previouslyUsedNumbers: [Int] = []
    let numberofQuestionPerRound = 5
    var currentQuestion: Question? = nil
    

    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //this will fill array with question and display the question
        fillData()
        displayQuestion()
    }
    
    //array with questions, answers and index of answer
    func fillData()
    {
        questionList.append(Question(questions: "iOS stands for?", answers: ["A) Internetwork Operating System","B) IPhone Operating System","C) Internet Operating System","D) None Of Them"], rightAnswerIndex: 1))
        questionList.append(Question(questions: "The IDE Used In Swift Is _____", answers: ["A) Swift","B) Gas","C) Xcode","D) Ld"], rightAnswerIndex: 2))
        questionList.append(Question(questions: "To Create Mutable Object _____ Is Used", answers: ["A) Let","B) Var","C) Both A&B","D) None"], rightAnswerIndex: 1))
        questionList.append(Question(questions: "To Create Contants In Swift We Use Keyword _____", answers: ["A) Conts","B) Let","C) Contants","D) None Of Above"], rightAnswerIndex: 1))
        questionList.append(Question(questions: "Double Has A Precision Of At Least _____ Decimal Digits In Swift.", answers: ["A) 15","B) 20","C) 17","D) None Of Above"], rightAnswerIndex: 0))
        questionList.append(Question(questions: "First IOS Was Written In _____", answers: ["A) 1984","B) 1985","C) 1986","D) 1987"], rightAnswerIndex: 2))
        questionList.append(Question(questions: "We Can Return Multiple Values In Swift From Function By Using?", answers: ["A) Array","B) Tupple","C) Both A&B","D) None Of Above"], rightAnswerIndex: 1))
        questionList.append(Question(questions: "Which Of The Following Is Incorrect Data Type In SWIFT ?", answers: ["A) UInt","B) Double","C) Char","D) Optional"], rightAnswerIndex: 2))
        questionList.append(Question(questions: "To Initialize Variable With Null Require ______", answers: ["A) ?","B) !","C) _","D) Null"], rightAnswerIndex: 0))
        questionList.append(Question(questions: "For Unwrapping Value Inside Optional What Should We Use?", answers: ["A) ?","B) !","C) @","D) None Of Above"], rightAnswerIndex: 1))
    }

    
    @IBAction func checkAnswer(_ sender: UIButton) {
        
        if let question = currentQuestion, let answer = sender.titleLabel?.text
        {
            //if selected option is right answer then it will increase 1 correct point and background color of button will turn into green
            if (question.validateAnswer(to: answer))
            {
                point.incrementCorrectAnswers()
                msgLabel.textColor = UIColor(red:0.15, green:0.61, blue:0.61, alpha:1.0)
                msgLabel.text = "Correct!"
                sender.backgroundColor = UIColor.systemGreen
            }
            
            //if selected option is wrong answer then it will increase 1 incorrect point and background color of button will turn into red
            else
            {
                point.incrementIncorrectAnswers()
                msgLabel.textColor = UIColor(red:0.82, green:0.40, blue:0.26, alpha:1.0)
                msgLabel.text = "Incorrect!"
                sender.backgroundColor = UIColor.red
                
            }
            
            //after click, all option will be disabled, coorect/incoorect message will shown and next button will be enable
            option1.isEnabled = false
            option2.isEnabled = false
            option3.isEnabled = false
            option4.isEnabled = false
            nextQuestion.isEnabled = true
            msgLabel.isHidden = false
        }
    }
    
    
    
    @IBAction func nextBtnClick(_ sender: UIButton) {
        msgLabel.text=""
        
        //if the question is last question then after clicking it will show score
        if (isGameOver())
        {
            displayScore()
        }
        
        //if the question is not the last question then after clicking it will show next question
        else
        {
            displayQuestion()
            option1.backgroundColor = UIColor(red:214, green:231, blue:55, alpha:1.0)
            option2.backgroundColor = UIColor(red:214, green:231, blue:55, alpha:1.0)
            option3.backgroundColor = UIColor(red:214, green:231, blue:55, alpha:1.0)
            option4.backgroundColor = UIColor(red:214, green:231, blue:55, alpha:1.0)
        }
    }
    
    // function to know that the question is last question or not
    func isGameOver() -> Bool
    {
        return point.numberofQuestionsAsked() >= numberofQuestionPerRound
    }
    
    
    // function for dispay question
    func displayQuestion ()
    {
        //it will display random question
        currentQuestion = getRandomQuestion()
        
        if let question = currentQuestion
        {
            let choices = question.getChoices()
            questionLabel.text = question.getQuestionTitle()
            option1.setTitle(choices[0], for: .normal)
            option2.setTitle(choices[1], for: .normal)
            option3.setTitle(choices[2], for: .normal)
            option4.setTitle(choices[3], for: .normal)
            
            // if the question is last question then button will be turn into End Quiz button
            if(point.numberofQuestionsAsked () == numberofQuestionPerRound - 1)
            {
                nextQuestion.setTitle ("End Quiz", for: .normal)
            }
            
            // if question is not the last question then it will be set to next question
            else
            {
                nextQuestion.setTitle("Next Question", for: .normal)
            }
        }
        
        // while displaying option all option will be enable for click but next button will be disable
        option1.isEnabled = true
        option2.isEnabled = true
        option3.isEnabled = true
        option4.isEnabled = true
        
        option1.isHidden = false
        option2.isHidden = false
        option3.isHidden = false
        option4.isHidden = false

        nextQuestion.isEnabled = false
    }
    
    // function for display the score
    func displayScore()
    {
        questionLabel.text = point.getScore()
        
        let finalScore = point.totalScore()
        
        // if final score is 0,1 or 2 then user can start again
        if finalScore==0 || finalScore==1 || finalScore==2
        {
            nextQuestion.setTitle("Start Again", for: .normal)
            point.reset()
        }
        
        // if final score is 3,4 or 5 then user cannot start again
        else
        {
            nextQuestion.isHidden=true
        }
        
        // while showing score all button and label will be hidden except question label
        msgLabel.isHidden = true
        option1.isHidden = true
        option2.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
    
    }
    // function to get array of random numbers
    func getRandomQuestion() -> Question
    {
        if (previouslyUsedNumbers.count == questionList.count)
        {
            previouslyUsedNumbers = []
        }
        var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questionList.count)
        
        while(previouslyUsedNumbers.contains (randomNumber))
        {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questionList.count)
        }
        
        previouslyUsedNumbers.append (randomNumber)
        return questionList[randomNumber]
    }
}

