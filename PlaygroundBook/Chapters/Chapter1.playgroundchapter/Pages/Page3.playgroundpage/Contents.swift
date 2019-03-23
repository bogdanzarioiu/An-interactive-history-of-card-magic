//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
// 
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code


//#-hidden-code
import PlaygroundSupport

var transpoView = CardTranspoViewController()

PlaygroundPage.current.liveView = transpoView
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code


//#-hidden-code
//transpoView.addingCards()
transpoView.performTransposition()

//#-end-hidden-code



//: [Previous](@previous) || [Next](@next)









