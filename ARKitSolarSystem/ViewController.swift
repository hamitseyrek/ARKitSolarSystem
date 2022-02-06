//
//  ViewController.swift
//  ARKitSolarSystem
//
//  Created by Hamit Seyrek on 6.02.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //MARK: - Create a box
        let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.001)
        let boxMaterials = SCNMaterial()
        boxMaterials.diffuse.contents = UIImage(named: "art.scnassets/wall.jpg")
        myBox.materials = [boxMaterials]
        
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5)
        node.geometry = myBox
        
        let moveShip = SCNAction.moveBy(x: 1, y: 0.3, z: -1, duration: 2)
        node.runAction(moveShip)
        
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
