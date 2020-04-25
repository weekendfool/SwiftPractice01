//
//  ViewController.swift
//  ar2
//
//  Created by 尾原徳泰 on 2020/04/26.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.scene = SCNScene()
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else {fatalError()}
            //ノードの作成
            let planNode = SCNNode()
            //ジオメトリの作成
            let geometry = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            geometry.materials.first?.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
            
            planNode.geometry = geometry
            planNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2.0, 1, 0, 0)
            
            node.addChildNode(planNode)
            
        }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else {fatalError()}
        guard let geometryPlaneNode = node.childNodes.first, let planeGeometory = geometryPlaneNode.geometry as? SCNPlane else {fatalError()}
        planeGeometory.width = CGFloat(planeAnchor.extent.x)
        planeGeometory.height = CGFloat(planeAnchor.extent.z)
        geometryPlaneNode.simdPosition = float3(planeAnchor.center.x, 0, planeAnchor.center.z)
        }
    
}
