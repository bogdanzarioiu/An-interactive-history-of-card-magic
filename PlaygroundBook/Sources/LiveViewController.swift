//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  An auxiliary source file which is part of the book-level auxiliary sources.
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import PlaygroundSupport

//@objc(Book_Sources_LiveViewController)
public class LiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
        public var jokerImage: UIImageView!
        public var titleLabel: UILabel!
    
    override public func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            //addJoker()
            addTitleLabel()
        
        }
    
    public func addJoker() {
            let jokerImageName = "jokercard2"
            let joker = UIImage(named: jokerImageName)
            jokerImage = UIImageView(image: joker!)
            jokerImage.alpha = 0
            UIView.animate(withDuration: 5.0) {
                self.jokerImage.alpha = 1
            }
            view.addSubview(jokerImage)
            addConstraintsForJokerImage()
        
        
        }
    
    public func addTitleLabel() {
            titleLabel = UILabel()
            titleLabel.text = "The magic is about to happen!"
            view.addSubview(titleLabel)
            addConstraintsForTitleLabel()
    }
    
    public func addConstraintsForJokerImage() {
            jokerImage.translatesAutoresizingMaskIntoConstraints = false
            jokerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            jokerImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            jokerImage.widthAnchor.constraint(equalToConstant: 189).isActive = true
            jokerImage.heightAnchor.constraint(equalToConstant: 254).isActive = true
        }
    
    public func addConstraintsForTitleLabel() {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
            titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        
    }
    public func receive(_ message: PlaygroundValue) {
       //switch message {
       // case let .integer(message):
//            if message == 3 {
//                titleLabel.text = "AWESOME!"
//                addJoker()
//            }
//             if message  < 3 {
//                titleLabel.text = "You motherfucker, snap more!"
//            }
//            else if message > 3 {
//                titleLabel.text = "Man, calm down!"
//            }
//        default:
//            titleLabel.text = "Only numbers"
//       }
//
        
    }
    
    public func liveViewMessageConnectionOpened() {}
    
    public func liveViewMessageConnectionClosed() {}
    

    

}
