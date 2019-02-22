//
//  GameScene.swift
//  FlappyBird
//
//  Created by ふるふる on 2019/02/23.
//  Copyright © 2019 Tsuyoshi Furuhata. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene
{
    var scrollNode:SKNode!
    
    // SKView上にシーンが表示された時に呼ばれるメソッド
    override func didMove(to view: SKView)
    {
        // 背景色を設定
        backgroundColor = UIColor(red: 0.15, green: 0.75, blue: 0.90, alpha: 1)
        
        // スクロールするスプライトの親ノード
        scrollNode = SKNode()
        addChild(scrollNode)
        
        // 各種スプライトを生成する処理をメソッドに分割
        setupGound()
        setupCould()
    }
    
    func setupGound()
    {
        // 地面の画像を読み込む
        let groundTexture = SKTexture(imageNamed: "ground")
        groundTexture.filteringMode = .nearest
        
        // 必要な枚数を計算
        let needNumber = Int(self.frame.size.width / groundTexture.size().width) + 2
        
        // スクロールするアクションを作成
        // 左方向に画像一枚分スクロールさせるアクション
        let moveGround = SKAction.moveBy(x: -groundTexture.size().width , y: 0 ,duration: 5)
        
        // 元の位置に戻すアクション
        let resetGround = SKAction.moveBy(x: groundTexture.size().width , y: 0, duration: 0)
        
        // 左にスクロール -> 元の位置 -> 左にスクロールと無限に繰り返すアクション
        let repeatScrollGound = SKAction.repeatForever(SKAction.sequence([moveGround, resetGround]))
        // groundのスプライトを配置する
        for _ in 0 ..< needNumber
        {
            // テクスチャを指定してスプライトを作成する
            let sprite = SKSpriteNode(texture: groundTexture)
            
            // スプライトの表示する位置を指定する
            sprite.position = CGPoint(
                x: groundTexture.size().width / 2,
                y: groundTexture.size().height / 2
            )
            // スプライトにアクションを設定する
            sprite.run(repeatScrollGound)
            
            // シーンにスプライトを追加する
            scrollNode.addChild(sprite)
        }
    }

    func setupCould()
    {
        // 地面の画像を読み込む
        let cloudTexture = SKTexture(imageNamed: "cloud")
        cloudTexture.filteringMode = .nearest
        
        // 必要な枚数を計算
        let needNumber = Int(self.frame.size.width / cloudTexture.size().width) + 2
        
        // スクロールするアクションを作成
        // 左方向に画像一枚分スクロールさせるアクション
        let moveCloud = SKAction.moveBy(x: -cloudTexture.size().width , y: 0 ,duration: 20)
        
        // 元の位置に戻すアクション
        let resetCloud = SKAction.moveBy(x: cloudTexture.size().width , y: 0, duration: 0)
        
        // 左にスクロール -> 元の位置 -> 左にスクロールと無限に繰り返すアクション
        let repeatScrollCloud = SKAction.repeatForever(SKAction.sequence([moveCloud, resetCloud]))
        // groundのスプライトを配置する
        for _ in 0 ..< needNumber
        {
            // テクスチャを指定してスプライトを作成する
            let sprite = SKSpriteNode(texture: cloudTexture)
            
            // スプライトの表示する位置を指定する
            sprite.position = CGPoint(
                x: cloudTexture.size().width / 2,
                y: cloudTexture.size().height / 2
            )
            // スプライトにアクションを設定する
            sprite.run(repeatScrollCloud)
            
            // シーンにスプライトを追加する
            scrollNode.addChild(sprite)
        }
    }
}
