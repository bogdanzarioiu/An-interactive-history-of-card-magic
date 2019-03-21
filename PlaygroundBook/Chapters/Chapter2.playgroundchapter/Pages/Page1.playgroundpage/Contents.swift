//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
// 
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
let str = "Hello, playground"

/*:
 ** Card Magic**
 The precise origins of card magic are subject to debate though it's generally believed that card tricks were first developed by gamblers who wanted to improve their chances of winning when playing card games.
 Our *goal* is to discover together this new world!
 
 Let's do some magic!
 Snap your fingers to make a playing card materialize.
 
 
 
 
 
 
 
 */

//#-hidden-code
func snapFingers() {

}
//-end-hidden-code
//*Hint* Modify the below variable to have the value of 1
var snapCounter: Int = /*#-editable-code this should be 1 */0/*#-end-editable-code*/



//#-hidden-code

import PlaygroundSupport

func show(_ message: (Int, String)) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        proxy.send(.integer(message), .String(message))
    }

}
//#-end-hidden-code

// Select a playing card to be displayed on the live view
//#-code-completion(everything, hide)
var playingCard: Int = /*#-editable-code Select a number*/12/*#-end-editable-code*/

//#-hidden-code
show(playingCard)
//#-end-hidden-code

//: [Previous](@previous) || [Next](@next)









