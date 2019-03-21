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
    
    override public func viewDidLoad() {
            super.viewDidLoad()
        view.backgroundColor = .white
            addJoker()
        
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
            addConstraints()
        
        }
    
    public func addConstraints() {
            jokerImage.translatesAutoresizingMaskIntoConstraints = false
            jokerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            jokerImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            jokerImage.widthAnchor.constraint(equalToConstant: 189).isActive = true
            jokerImage.heightAnchor.constraint(equalToConstant: 254).isActive = true
        }

    public func receive(_ message: PlaygroundValue) {
        switch message {
        case let .integer(message):
            if message == 1 {
                print("Perfect!😃")
              
            
            }
            else if message == 0 {
                print("You need to snap your fingers once for magic to happen!")
            }
            else if message > 1 {
                print("Too many snaps, let's go baby steps!😅")
            }
        default:
            print("Only numbers")
        }
        
        
    }
    
    public func liveViewMessageConnectionOpened() {}
    
    public func liveViewMessageConnectionClosed() {}
    

    

}
