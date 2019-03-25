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
//:Card magic, in many forms, arised since the time playing cards became commonly
//: known, towards the second half of the fourteenth century.
//:The precise origins of card magic are subject to debate though it's generally believed that
//:card tricks were first developed by gamblers who wanted to improve their chances of winning when
//:playing card games.\
//:Illusions performed with playing cards were (and still are) constructed using from basic
//: to advanced card manipulation techniques (or sleights).
//:New techniques and subtleties are created from scratch or based on old ones
//:with the purpose of achieving a higher level of deception.
//:It's imperative  that each effect  includes presentation or commonly called *patter*
//:amongst magicians.\
//:*This book* aims book to give the reader the experience of the most common magic plots
//:in a fun and interactive way!\
//:Let's do some magic!
//:
//: * callout(Card trick performance):
//:    ![Card trick performance](Welles-Sandburg-1942.jpg)
//:  Orson Welles performs a card trick for Carl Sandburg (August 1942)

/*:
# Making playing cards appear effortlessly
 */

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
//:**Hint! Feel free to play with the numbers but remember that 3 is the magic one!**
//Modify the below variable
//#-code-completion(everything, hide)
var numberOfSnaps: Int = /*#-editable-code */0/*#-end-editable-code*/


//#-hidden-code
snapFingers(numberOfSnaps)
//jokerView.addJoker()

if numberOfSnaps == 3 {
    jokerView.titleLabel.text = "Awesome!👏"
    jokerView.setupContainer()
    PlaygroundPage.current.assessmentStatus = .pass(message: "That's a very good start! Feel free to move on the [**next page**](@next).")
}
if numberOfSnaps > 3 {
    jokerView.titleLabel.text  = "You snapped too many times!"
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Pay attention to the hint."], solution: nil)
}
if numberOfSnaps < 3 {
    jokerView.titleLabel.text = "We need more snaps for magic to happen!"
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Pay attention to the hint."], solution: nil)
}

//#-end-hidden-code
//:[Next](@next)









