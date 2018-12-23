Pod::Spec.new do |s|
  s.name                        = "DataService"
  s.version                     = "0.1.0"
  s.source                      = { :git => "https://github.com/cliftonr/DataService.git" }

  s.summary                     = "Development pod which interacts with the web API."
  s.homepage                    = "https://github.com/cliftonr/GraphQLClient-iOS/InternalPods/DataService"
  s.authors                     = { "Clifton R." => "example@example.com" }
  s.license                     = "MIT"

  s.platform                    = :ios, "10.0"
  s.source_files             	= "Sources/**/*.{swift,graphql}"

  ### Internal pods
  s.dependency "Components"

  ### Data
  s.dependency "Apollo"

  ### Rx
  s.dependency "RxCocoa"
  s.dependency "RxSwift"

  ### Build scripts
  s.script_phase = {
      :name => "Generate Apollo GraphQL API",
      :script => "${PODS_TARGET_SRCROOT}/Scripts/BuildPhase/GenerateGraphQLAPI.sh",
      :execution_position => :before_compile
  }
end
