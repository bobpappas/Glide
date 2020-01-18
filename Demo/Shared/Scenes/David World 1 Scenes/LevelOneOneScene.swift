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
    
    override func setupScene() {
        super.setupScene()
        
        let playerEntity = SimplePlayerEntity(initialNodePosition: defaultPlayerStartLocation, playerIndex: 0)
        addEntity(playerEntity)
        
        setupTips()
    }
    
    func setupTips() {
        #if os(OSX)
        let tipEntity = GameplayTipEntity(initialNodePosition: TiledPoint(5, 12).point(with: tileSize),
                                          text: "Use the keyboard (a - d - space bar) or connect a game controller to walk and jump (A).",
                                          frameWidth: 220.0)
        addEntity(tipEntity)
        #elseif os(iOS)
        var tipWidth: CGFloat = 200.0
        if UIDevice.current.userInterfaceIdiom == .pad {
            tipWidth = 220.0
        }
        
        let tipEntity = GameplayTipEntity(initialNodePosition: TiledPoint(5, 12).point(with: tileSize),
                                          text: "Use the touch buttons or connect a game controller to walk and jump (A).",
                                          frameWidth: tipWidth)
        addEntity(tipEntity)
        #elseif os(tvOS)
        let tipEntity = GameplayTipEntity(initialNodePosition: TiledPoint(5, 14).point(with: tileSize),
                                          text: "Use the remote or connect a game controller to walk and jump (A).",
                                          frameWidth: 300.0)
        addEntity(tipEntity)
        #endif
    }
}
