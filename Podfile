# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

post_install do |installer|
        installer.pods_project.build_configurations.each do |config|
                config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
        end
end

target 'Zatch' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Zatch

  pod 'SnapKit', '~> 5.6.0'

  pod 'Then'

  pod 'SideMenu', '~> 6.0'

  pod 'Moya', '~> 15.0'

  pod 'RxSwift'
  pod 'RxCocoa'
  pod "RxGesture"

  pod 'Kingfisher', '~> 7.0' #이미지

  pod 'KakaoSDKCommon'  # 필수 요소를 담은 공통 모듈
  pod 'KakaoSDKAuth'  # 사용자 인증
  pod 'KakaoSDKUser'  # 카카오 로그인, 사용자 관리 

  pod 'Cosmos', '~> 23.0' # 별점

  target 'ZatchTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ZatchUITests' do
    # Pods for testing
  end

end
