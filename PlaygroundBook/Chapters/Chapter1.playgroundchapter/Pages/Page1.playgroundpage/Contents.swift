//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
// 
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
//:Hello!👋
//:
//:Let's talk a bit  about magic. In my opinion, magic is more than sleight of
//:hand, misdirection and showmanship. Magic is emotion and connects people in a strong way.
//: Magic creates emphaty.
//:
//:*A bit of history*
//:
//:The precise origins of card magic are subject to debate though it's generally believed that
//:card tricks were first developed by gamblers who wanted to improve their chances of winning when
//:playing card games.
//:Our **goal** is to experience the most common magic plots in a fun and interactive way!\
//:Let's do some magic!
//:
//:
//:**1.Making playing cards appear effortlessly.**\
//:**Experiment:** Snap your fingers to make a playing card materialize.
//#-hidden-code
import PlaygroundSupport
var jokerView = LiveViewController()
PlaygroundPage.current.liveView = jokerView
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code
//#-hidden-code
func snapFingers(_ message: Int) {
        jokerView.send(.integer(message))

    }
//#-end-hidden-code
//:**Hint!** Feel free to play with the numbers but remember that 3 is the magic one!
//Modify the below variable
//#-code-completion(everything, hide)
var numberOfSnaps: Int = /*#-editable-code */0/*#-end-editable-code*/


//#-hidden-code
snapFingers(numberOfSnaps)
//jokerView.addJoker()

if numberOfSnaps == 3 {
    jokerView.titleLabel.text = "Awesome,motherfucker!👏"
    jokerView.addJoker()
    PlaygroundPage.current.assessmentStatus = .pass(message: "That's a very good start!  Feel free to move on the [**next page**](@next).")
}
if numberOfSnaps > 3 {
    jokerView.titleLabel.text  = "Enough, motherfucker!"
    PlaygroundPage.current.assessmentStatus = .pass(message: "Pay attention to the hint.")
}
if numberOfSnaps < 3 {
    jokerView.titleLabel.text = "Snap more, motherfucker!"
    PlaygroundPage.current.assessmentStatus = .pass(message: "Pay attention to the hint.")
}

//#-end-hidden-code
//:[Next](@next)









