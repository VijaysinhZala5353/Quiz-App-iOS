//
//  Point.swift
//  QuizApp
//
//  Created by user211064 on 3/13/22.
//

import Foundation

class Point
{
    var correctAnswers: Int = 0
    var incorrectAnswers: Int = 0
    var questionPerRound = 5

    
    // for restart game score will be reset
    func reset ()
    {
        correctAnswers = 0
        incorrectAnswers = 0
    }
    
    // 1 correct point will given upon right answer
    func incrementCorrectAnswers()
    {
        correctAnswers += 1
    }
    
    // 1 incorrect point will given upon wrong answer
    func incrementIncorrectAnswers ()
    {
        incorrectAnswers += 1
    }
    
    // total asked question will be return using total correct and incorrect point
    func numberofQuestionsAsked () -> Int
    {
        return correctAnswers + incorrectAnswers
    }
    
    // Score and message will be shown upon correct answers
    func getScore() -> String
    {
        if (correctAnswers == 5)
        {
            return "Your Score : \(correctAnswers) / \(questionPerRound) \n\n\n\n You are a genius!"
        }
        
        else if (correctAnswers == 4)
        {
            return "Your Score : \(correctAnswers) / \(questionPerRound) \n\n\n\n Excellent Work!"
        }
        
        else if (correctAnswers == 3)
        {
            return "Your Score : \(correctAnswers) / \(questionPerRound) \n\n\n\n Good Job!"
        }
        
        else
        {
            return "Your Score : \(correctAnswers) / \(questionPerRound) \n\n\n\n Please Try Again! "
        }
    }
    
    // function will return total number of correct answers
    func totalScore() -> Int
    {
        return correctAnswers
    }
}

