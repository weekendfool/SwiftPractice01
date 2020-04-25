//
//  ViewController.swift
//  ar1
//
//  Created by 尾原徳泰 on 2020/04/25.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ARSCNViewDelegateの受け取りを自身に設定
        sceneView.delegate = self
        //インスタンス作成
        sceneView.scene = SCNScene()
        //特徴点の表示
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        //ライトの追加
        sceneView.autoenablesDefaultLighting = true
        //平面の検出
        let configuration = ARWorldTrackingConfiguration()
        //平面の検出
        configuration.planeDetection = .horizontal
        //セッションの開始
        sceneView.session.run(configuration)
    }
    
    //
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        //球のノードを作成
        let sphereNode = SCNNode()
        
        //球体にするための設定
        sphereNode.geometry = SCNSphere(radius: 0.05)
        sphereNode.position.y += Float(0.05)
        
        //検出面の子要素に追加
        node.addChildNode(sphereNode)
    }
}
