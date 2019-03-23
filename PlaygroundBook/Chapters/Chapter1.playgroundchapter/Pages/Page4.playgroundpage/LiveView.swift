//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import PlaygroundSupport


// Instantiate a new instance of the live view from the book's auxiliary sources and pass it to PlaygroundSupport.

var tornView = TornAndRestoredCardViewController()

PlaygroundPage.current.liveView = tornView
PlaygroundPage.current.needsIndefiniteExecution = true
//tornView.placingTornCards()
//tornView.constraintsForTornCards()

//tornView.restoreCardsFromHalves()
//transpoView.addingCards()








