source "https://github.com/CocoaPods/Specs.git"

platform :ios, "10.0"
use_frameworks!

workspace "GraphQLClient-iOS"

target "GraphQLClient-iOS" do
  project "GraphQLClient-iOS"

  ### Internal pods
  pod "Components", :path => "InternalPods/Components"
  pod "DataService", :path => "InternalPods/DataService"

  ### Rx
  pod "RxCocoa"
  pod "RxCoreData"
  pod "RxSwift"

  ### UI
  pod "SVProgressHUD"

  ### Tools
  pod "SwiftGen"

  ### Tests
  target "GraphQLClient-iOSTests" do
    inherit! :search_paths

    ### Rx
    pod "RxBlocking"
    pod "RxTest"
  end

  ### Build scripts
  script_phase :name => "Generate Constants",
    :script => "${PROJECT_DIR}/Scripts/BuildPhase/GenerateConstants.sh",
    :execution_position => :before_compile
end
