//
//  SimpleAdventurerScene.swift
//  glide Demo
//
//  Copyright (c) 2019 cocoatoucher user on github.com (https://github.com/cocoatoucher/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import GlideEngine
import SpriteKit

class LevelOneOneScene: BaseLevelScene {
    
    let horizontalPlatformTileSet = DemoTileSet.horizontalPlatformsTileSet()
    
    var verticalMovingPlatform: MovingPlatformEntity {
        let changeDirectionProfile = SelfChangeDirectionComponent.Profile(condition: .displacement(-100.0), axes: .vertical, delay: 0.3, shouldKinematicsBodyStopOnDirectionChange: false)
        let movingPlatform = MovingPlatformEntity(bottomLeftPosition: TiledPoint(13, 14),
                                                  colliderSize: TiledSize(3, 1).size(with: tileSize),
                                                  movementAxes: [.vertical],
                                                  changeDirectionProfiles: [changeDirectionProfile],
                                                  providesOneWayCollision: true,
                                                  tileSize: tileSize)
        
        let tiledNodeComponent = TileMapNodeComponent(numberOfColumns: 5, tileSet: horizontalPlatformTileSet, tileSize: tileSize)
        tiledNodeComponent.zPositionContainer = DemoZPositionContainer.platforms
        movingPlatform.addComponent(tiledNodeComponent)
        return movingPlatform
    }
    
    lazy var playerEntity: GlideEntity = {
        
        let entity = SimplePlayerEntity(initialNodePosition: defaultPlayerStartLocation, playerIndex: 0)
        let updateGemCounterComponent = UpdateGemCounterComponent(gemCounterEntity: gemCounterEntity)
        entity.addComponent(updateGemCounterComponent)
        
        return entity
    }()
    
    lazy var gemCounterEntity = GemCounterEntity(initialNodePosition: .zero)
    
    func gemEntity(at position: TiledPoint) -> GlideEntity {
        return GemEntity(bottomLeftPosition: position.point(with: tileSize))
    }
    
    override func setupScene() {
        
        mapContact(between: GlideCategoryMask.player, and: DemoCategoryMask.collectible)
        addEntity(verticalMovingPlatform)
        addEntity(gemEntity(at: TiledPoint(57, 8)))
        addEntity(gemEntity(at: TiledPoint(58, 8)))
        addEntity(gemEntity(at: TiledPoint(59, 8)))
        addEntity(gemEntity(at: TiledPoint(68, 8)))
        addEntity(gemEntity(at: TiledPoint(69, 8)))
        addEntity(gemEntity(at: TiledPoint(70, 8)))
        addEntity(gemEntity(at: TiledPoint(71, 8)))
        addEntity(gemEntity(at: TiledPoint(84, 8)))
        addEntity(gemEntity(at: TiledPoint(85, 8)))
        addEntity(gemEntity(at: TiledPoint(84, 9)))
        addEntity(gemEntity(at: TiledPoint(85, 9)))
        addEntity(gemEntity(at: TiledPoint(126, 10)))
        addEntity(gemEntity(at: TiledPoint(127, 10)))
        addEntity(gemEntity(at: TiledPoint(128, 10)))
        addEntity(gemEntity(at: TiledPoint(129, 10)))
        addEntity(gemEntity(at: TiledPoint(130, 10)))
        addEntity(gemEntity(at: TiledPoint(131, 10)))
        addEntity(gemEntity(at: TiledPoint(145, 9)))
        addEntity(gemEntity(at: TiledPoint(147, 9)))
        addEntity(gemEntity(at: TiledPoint(149, 9)))
        addEntity(gemEntity(at: TiledPoint(146, 8)))
        addEntity(gemEntity(at: TiledPoint(148, 8)))
        addEntity(gemEntity(at: TiledPoint(150, 8)))
        addEntity(gemCounterEntity)
        super.setupScene()
        let playerEntity = SimplePlayerEntity(initialNodePosition: defaultPlayerStartLocation, playerIndex: 0)
        addEntity(playerEntity)
    }
}
