//
//  audio.swift
//  Quizzler-iOS13
//
//  Created by 金城信哉 on 2020/06/22.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
import AVFoundation

let url = Bundle.main.url(forResource: "correct", withExtension: "mp3")
player = try! AVAudioPlayer(contentsOf: url!)
player.play()
