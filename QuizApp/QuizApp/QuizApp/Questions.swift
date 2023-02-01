//
//  Questions.swift
//  QuizApp
//
//  Created by user211064 on 3/13/22.
//

import Foundation

class Question
{
    let questions : String
    let answers : [String]
    let rightAnswerIndex : Int
    
    init(questions:String, answers:[String], rightAnswerIndex:Int)
    {
        self.questions=questions
        self.answers=answers
        self.rightAnswerIndex=rightAnswerIndex
        
    }
    
    // function will check answer is correct or not
    func validateAnswer(to givenAnswer:String) -> Bool
    {
        return (givenAnswer == answers[rightAnswerIndex])
    }
    
    
    // function will return questions from questionlist
    func getQuestionTitle() -> String
    {
        return questions
    }
    
    // function will return right answer
    func getAnswer() -> String
    {
        return answers[rightAnswerIndex]
    }
    
    // function will return array of answers which will become options
    func getChoices() -> [String]
    {
        return answers
    }
    
    // function will get index of right answer
    func getAnswerAt(index:Int) -> String
    {
        return answers[index]
    }
}
