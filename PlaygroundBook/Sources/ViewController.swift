//
//  ViewController.swift
//  
//
//  Created by Zarioiu Bogdan on 3/23/19.
//  Copyright © 2019 Zarioiu Bogdan. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import PlaygroundSupport
import Foundation


public class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, PlaygroundLiveViewMessageHandler {

    public var sceneView: ARSCNView!
    public var playingCardNode: SCNNode!
    public let session = ARSession()
   
    
    override public func loadView() {
        super.loadView()
        sceneView = ARSCNView(frame: CGRect(x: 0, y: 0, width: 500, height: 700))
        let scene = SCNScene()
        sceneView.scene = scene
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.session.delegate = self
        self.view = sceneView
        
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        //sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
       
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        configuration.isLightEstimationEnabled = true
        
        // Run the view's session
        sceneView.session.run(configuration)
    
    }
    
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        configuration.isLightEstimationEnabled = true
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    public func addPlayingCardInSpace() {
        playingCardNode = SCNNode(geometry: SCNPlane(width: 0.6, height: 0.8))
        playingCardNode.position = SCNVector3(0, 0, -8)
        playingCardNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "kingOfClubs")
        playingCardNode.geometry?.firstMaterial?.isDoubleSided = true
        playingCardNode.opacity = 0
        let fadeIn = SCNAction.fadeIn(duration: 2.5)
        let move = SCNAction.move(to: SCNVector3(0, 0, -1.3), duration: 3)
        let actions = SCNAction.sequence([fadeIn, move])
        playingCardNode.runAction(actions)
        sceneView.scene.rootNode.addChildNode(playingCardNode)
    }
    
   
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }


    
    
    private func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
  
    }
  
    private func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
   
    private func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
   
    private func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    public func receive(_ message: PlaygroundValue) {
        addPlayingCardInSpace()
    }
    
    public func liveViewMessageConnectionOpened() {}
    
    public func liveViewMessageConnectionClosed() {}
}
