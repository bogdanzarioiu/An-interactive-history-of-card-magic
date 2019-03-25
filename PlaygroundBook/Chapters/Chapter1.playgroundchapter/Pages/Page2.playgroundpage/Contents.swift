//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
// 
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code



//:**"Wonder is the first of all the passions." - Descartes**
//:
//:
//:
//:
//:
//:A bit of mystery ehnances every performance. Many magicians choose to rather be ambigous
//:when they perform a trick. Although this doesn't suit any personality, it helps
//:for sure in building suspense and being rewarded at the end with bigger reactions.

/*:
 # Color Changes
 */

//:A color change is the effect of changing one card to another in front of the spectators eyes. There are many
//:different techniques to accomplish this effect, one more difficult than the other.
//:
//:**Experiment: Perform a color change! Or many!**
//:**Tap Run My Code**

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
//Set the values of the below variable to different values from two to 4 to experience a color change!
var cardsToChange: Int = /*#-editable-code Select a number*/0/*#-end-editable-code*/

//#-hidden-code
performMagic(cardsToChange)

//: [Previous](@previous) || [Next](@next)
if cardsToChange == 2 {
    changeCardsView.changeTwoCards()
    PlaygroundPage.current.assessmentStatus = .pass(message: "Awesome! Feel free to try different values. You can go to the [**next page**](@next) whenever you want")
    changeCardsView.titleLabel.text = "Great!"
}
if cardsToChange  <= 1 {
    //I will print that we need at least 2 cards to perform a color change
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["We don't have enough cards for a color change"], solution: nil)
    changeCardsView.titleLabel.text = "We need at least 2 cards to perform a color change!"
    
}


if cardsToChange == 3 {
    changeCardsView.changeThreeCards()
    
}

if cardsToChange == 4 {
    changeCardsView.changeFourCards()
}

if cardsToChange >= 5 {
    changeCardsView.titleLabel.text = "We don't have that many cards"
}
//-end-hidden-code










