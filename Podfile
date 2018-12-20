source "https://github.com/CocoaPods/Specs.git"

platform :ios, "10.0"
use_frameworks!

workspace "GraphQLClient-iOS"

target "GraphQLClient-iOS" do
  project "GraphQLClient-iOS"

  ### Rx
  pod "RxCocoa"
  pod "RxSwift"

  ### UI
  pod "SVProgressHUD"

  ### Scripts
  pod "SwiftGen"

  target "GraphQLClient-iOSTests" do
    inherit! :search_paths

    ### Rx
    pod "RxBlocking"
    pod "RxTest"
  end
end
