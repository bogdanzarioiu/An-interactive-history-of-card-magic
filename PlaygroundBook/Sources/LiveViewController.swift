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
    
        public var jokerImageView: UIImageView!
        public var containerView: UIView!
        public var titleLabel: UILabel!
    
    override public func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            //setupContainer()
            addTitleLabel()
        
        }
    
    public func setupContainer() {
        containerView = UIView(frame: CGRect(x: view.frame.width / 2 - 189 / 2, y: view.frame.height / 2 - 254 / 2, width: 189, height: 254))
        view.addSubview(containerView)
        addingContainerViewConstraints()
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: 10).cgPath
        addJoker()
    }
    
    public func addJoker() {
        let jokerImageViewName = "joker"
        let joker = UIImage(named: jokerImageViewName)
        jokerImageView = UIImageView(image: joker!)
        jokerImageView.frame = containerView.bounds
        jokerImageView.clipsToBounds = true
        jokerImageView.layer.cornerRadius = 10
        containerView.addSubview(jokerImageView)
        jokerImageView.alpha = 0
            UIView.animate(withDuration: 2.0) {
                self.jokerImageView.alpha = 1
            }
        
        
            addConstraintsForjokerImageView()
        }
    

    public func addingContainerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 254).isActive = true
    }
    
    
    
    public func addTitleLabel() {
        titleLabel = UILabel()
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.text = "The magic is about to happen!"
        titleLabel.font = UIFont.systemFont(ofSize: 20.0)
        view.addSubview(titleLabel)
        addConstraintsForTitleLabel()
    }
    
    public func addConstraintsForjokerImageView() {
        jokerImageView.translatesAutoresizingMaskIntoConstraints = false
        jokerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        jokerImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        jokerImageView.widthAnchor.constraint(equalToConstant: 189).isActive = true
        jokerImageView.heightAnchor.constraint(equalToConstant: 254).isActive = true
        }
    
    public func addConstraintsForTitleLabel() {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
            titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    public func receive(_ message: PlaygroundValue) {
  
    }
    
    public func liveViewMessageConnectionOpened() {}
    
    public func liveViewMessageConnectionClosed() {}
    

    

}
