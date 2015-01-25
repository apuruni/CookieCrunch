//
//  GameScene.swift
//  CookieCrunch
//
//  Created by Apurune on 2015/01/03.
//  Copyright (c) 2015年 Apurune. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var level: Level!
    
    let TileWidth: CGFloat = 32.0
    let TileHeight: CGFloat = 36.0
    
    let gameLayer = SKNode()
    let cookiesLayer = SKNode()
    let tilesLayer = SKNode()
    
    var swipeFromColumn: Int?
    var swipeFromRow: Int?
    
    var swipeHandler: ((Swap) ->())?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) is not used in this app")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "Background")
        addChild(background)
        
        addChild(gameLayer)
        
        let layerPosition = CGPoint(
            x: -TileWidth * CGFloat(NumColumns) / 2,
            y: -TileHeight * CGFloat(NumRows) / 2)
        
        tilesLayer.position = layerPosition
        gameLayer.addChild(tilesLayer)
        
        cookiesLayer.position = layerPosition
        gameLayer.addChild(cookiesLayer)
        
        swipeFromColumn = nil
        swipeFromRow = nil
    }
    
    func addSpritesForCookies(cookies: Set<Cookie>) {
        for cookie in cookies {
            let sprite = SKSpriteNode(imageNamed: cookie.cookieType.spriteName)
            sprite.position = pointOfColumn(cookie.column, row: cookie.row)
            cookiesLayer.addChild(sprite)
            cookie.sprite = sprite
        }
    }
    
    func addTiles() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if let tile = level.tileAt(column, row: row) {
                    let tileNode = SKSpriteNode(imageNamed: "Tile")
                    tileNode.position = pointOfColumn(column, row: row)
                    tilesLayer.addChild(tileNode)
                }
            }
        }
    }
    
    func pointOfColumn(column: Int,  row: Int) -> CGPoint {
        return CGPoint(
            x: CGFloat(column) * TileWidth + TileWidth / 2,
            y: CGFloat(row) * TileHeight + TileHeight / 2)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject() as UITouch
        let location = touch.locationInNode(cookiesLayer)
        let (success, column, row) = convertPoint(location)
        if success {
            if let cookie = level.cookieAt(column, row: row) {
                swipeFromColumn = column
                swipeFromRow = row
                println("swipe from cookie: \(cookie)")
            }
        }
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if swipeFromColumn == nil { return }
        
        let touch = touches.anyObject() as UITouch
        let localtion = touch.locationInNode(cookiesLayer)
        
        let (succuess, colomn, row) = convertPoint(localtion)
        if succuess {
            var horzDelta = 0, verDelta = 0
            if colomn < swipeFromColumn! {
                horzDelta = -1
            } else if colomn > swipeFromColumn! {
                horzDelta = 1
            } else if row < swipeFromRow! {
                verDelta = -1
            } else if row > swipeFromRow! {
                verDelta = 1
            }
            
            if horzDelta != 0 || verDelta != 0 {
                trySwapHorizontal(horzDelta, vertical: verDelta)
                swipeFromColumn = nil
            }
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        swipeFromColumn = nil
        swipeFromRow = nil
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        touchesEnded(touches, withEvent: event)
    }
    
    func trySwapHorizontal(horzDetal: Int, vertical verDelta: Int) {
        let toColumn = swipeFromColumn! + horzDetal
        let toRow = swipeFromRow! + verDelta
        
        if toColumn < 0 || toColumn >= NumColumns { return }
        if toRow < 0 || toRow >= NumRows { return }
        
        if let toCookie = level.cookieAt(toColumn, row: toRow) {
            if let fromCookie = level.cookieAt(swipeFromColumn!, row: swipeFromRow!) {
                println("swiping \(fromCookie) with \(toCookie)")
                if let handler = swipeHandler {
                    let swap = Swap(cookieA: fromCookie, cookieB: toCookie)
                    handler(swap)
                }
            }
        }
    }
    
    func convertPoint(point: CGPoint) -> (success: Bool, column: Int, row: Int) {
        if point.x >= 0 && point.x < CGFloat(NumColumns) * TileWidth &&
           point.y >= 0 && point.y < CGFloat(NumRows) * TileHeight {
            return (true, Int(point.x / TileWidth), Int(point.y / TileHeight))
        } else {
            return (false, 0, 0)
        }
    }
    
    func animateSwap(swap: Swap, completion: () -> () ) {
        let spriteA = swap.cookieA.sprite!
        let spriteB = swap.cookieB.sprite!
        
        spriteA.zPosition = 100
        spriteB.zPosition = 90
        
        let duration: NSTimeInterval = 0.3
        
        let moveA = SKAction.moveTo(spriteB.position, duration: duration)
        moveA.timingMode = .EaseOut
        spriteA.runAction(moveA,completion: completion)
        
        let moveB = SKAction.moveTo(spriteA.position, duration: duration)
        moveB.timingMode = .EaseOut
        spriteB.runAction(moveB)
    }
 }
