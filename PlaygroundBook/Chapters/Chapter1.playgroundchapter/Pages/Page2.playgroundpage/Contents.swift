//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
// 
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

//:**"Wonder is the first of all the passions."**
//:
//: * callout(Descartes - The Passions of The Soul, Article 53)
//:
//: ![flip book](jokers.png)\
//:
//:
//:Being able to give someone the **"How did you do that??"** feeling is priceless. It will connect you
//:with the person, it will create empathy.
//:
//:**2.Changing playing cards.**\
//:**Experiment:** Perform a color change! Or many!

//#-hidden-code
import PlaygroundSupport
import  UIKit

var changeCardsView = ChangingCardsViewController()
var jokerView: UIImageView!

PlaygroundPage.current.liveView = changeCardsView
PlaygroundPage.current.needsIndefiniteExecution = true

func performMagic(_ message: Int) {
    changeCardsView.send(.integer(message))
    
}

//#-end-hidden-code

//Call the function with different values up to 5 to see the magic!
var cardsToChange: Int = /*#-editable-code Select a number*/0/*#-end-editable-code*/

//#-hidden-code
performMagic(cardsToChange)
//-end-hidden-code
if cardsToChange == 1 {
    changeCardsView.changeCards()
    PlaygroundPage.current.assessmentStatus = .pass(message: "Awesome! [**next page**](@next).")
}


// Select a playing card to be displayed on the live view
//#-code-completion(everything, hide)
//var playingCard: Int = /*#-editable-code Select a number*/12/*#-end-editable-code*/

//#-hidden-code
//show(playingCard)
//#-end-hidden-code
//#-hidden-code


//#-end-hidden-code
//: [Previous](@previous) || [Next](@next)









