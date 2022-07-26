//
//  TamaInfo.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/24.
//

import Foundation
import UIKit

struct TamaInfo {
    
    let tamaName = ["따끔따끔", "방실방실", "반짝반짝"]
    let tamaBaseImage = ["1-7.png", "2-7.png", "3-7.png"]
    let tamaInformation = ["저는 선인장 다마고치 입니다. 키는 2cm몸무게는 150g 이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님!!!", "저는 방실방실 다마고치입니당. 키는 100km 몸무게는 150톤이에용 성격은 화끈하고 날라다닙니당~! 열심히 잘 먹고 잘 클 자신은 있답니당 방실방실!", "저는 반짝반짝 다마고치 입니다. 키는 170cm 몸무게는 70kg 이에요. 성격은 항상 밝고 반짝여요! 열심히 잘 먹고 잘 클 자신은 있답니다. 저를 키워주세요 주인님!"]
    
    // 버블 상태메시지
    let tamaStatus = ["안녕하세요","배가 고파요", "응애! 나 아기 다마고치 밥 줘", "공부를 더 열심히 하셔야겠어요!", "오늘 푸쉬하셨나요?", "힘내세요!", "졸리면 일어나서 공부하세요!", "이라고 부르지만 제가 주인이에요^^", "TIL도 작성해주셔야죠!", "큰 일 났어요! 목이 말라요", "오늘도 고생하셨어요:)"]
}

/*
 1. 개별 피드백 -> 구조체 모델
 2. MainViewController 이름 바꾸기(실제로 해봤는데 여러곳에서 에러가 나타남(변수 명 다 바꿔줘도))
 3. Userdefault rice, water riceCnt, waterCnt로 바꿔서 화면에 나타내기
 4. button 동작 하나로 통일해보기
 */
