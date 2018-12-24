//  This file was automatically generated and should not be edited.

import Apollo

public final class StudySetsByCreatorQuery: GraphQLQuery {
  public let operationDefinition =
    "query StudySetsByCreator($creatorId: ID!) {\n  studySets(creatorId: $creatorId) {\n    __typename\n    ...baseModelFields\n    title\n    description\n    creatorUser: creator {\n      __typename\n      ...baseModelFields\n      username\n      email\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(BaseModelFields.fragmentDefinition) }

  public var creatorId: GraphQLID

  public init(creatorId: GraphQLID) {
    self.creatorId = creatorId
  }

  public var variables: GraphQLMap? {
    return ["creatorId": creatorId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("studySets", arguments: ["creatorId": GraphQLVariable("creatorId")], type: .nonNull(.list(.nonNull(.object(StudySet.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(studySets: [StudySet]) {
      self.init(unsafeResultMap: ["__typename": "Query", "studySets": studySets.map { (value: StudySet) -> ResultMap in value.resultMap }])
    }

    /// Get all sets belonging to user with creatorId.
    public var studySets: [StudySet] {
      get {
        return (resultMap["studySets"] as! [ResultMap]).map { (value: ResultMap) -> StudySet in StudySet(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: StudySet) -> ResultMap in value.resultMap }, forKey: "studySets")
      }
    }

    public struct StudySet: GraphQLSelectionSet {
      public static let possibleTypes = ["StudySet"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(BaseModelFields.self),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("creator", alias: "creatorUser", type: .nonNull(.object(CreatorUser.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Title for the set.
      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// Optional description for the set.
      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// The user who created the set.
      public var creatorUser: CreatorUser {
        get {
          return CreatorUser(unsafeResultMap: resultMap["creatorUser"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "creatorUser")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var baseModelFields: BaseModelFields {
          get {
            return BaseModelFields(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct CreatorUser: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(BaseModelFields.self),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, created: String, changed: String, isDeleted: Bool, username: String, email: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "created": created, "changed": changed, "isDeleted": isDeleted, "username": username, "email": email])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// User's unique handle.
        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        /// User's unique email address.
        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var baseModelFields: BaseModelFields {
            get {
              return BaseModelFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class StudySetDetailsQuery: GraphQLQuery {
  public let operationDefinition =
    "query StudySetDetails($setId: ID!) {\n  studySet(setId: $setId) {\n    __typename\n    ...baseModelFields\n    title\n    description\n    creatorUser: creator {\n      __typename\n      ...baseModelFields\n      username\n      email\n    }\n    terms {\n      __typename\n      ...baseModelFields\n      word\n      definition\n      containingSet: parentSet {\n        __typename\n        ...baseModelFields\n        title\n        description\n        creatorUser: creator {\n          __typename\n          ...baseModelFields\n          username\n          email\n        }\n      }\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(BaseModelFields.fragmentDefinition) }

  public var setId: GraphQLID

  public init(setId: GraphQLID) {
    self.setId = setId
  }

  public var variables: GraphQLMap? {
    return ["setId": setId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("studySet", arguments: ["setId": GraphQLVariable("setId")], type: .object(StudySet.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(studySet: StudySet? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "studySet": studySet.flatMap { (value: StudySet) -> ResultMap in value.resultMap }])
    }

    /// Get set with given id.
    public var studySet: StudySet? {
      get {
        return (resultMap["studySet"] as? ResultMap).flatMap { StudySet(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "studySet")
      }
    }

    public struct StudySet: GraphQLSelectionSet {
      public static let possibleTypes = ["StudySet"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(BaseModelFields.self),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("creator", alias: "creatorUser", type: .nonNull(.object(CreatorUser.selections))),
        GraphQLField("terms", type: .nonNull(.list(.nonNull(.object(Term.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Title for the set.
      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// Optional description for the set.
      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// The user who created the set.
      public var creatorUser: CreatorUser {
        get {
          return CreatorUser(unsafeResultMap: resultMap["creatorUser"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "creatorUser")
        }
      }

      /// The terms contained in the set.
      public var terms: [Term] {
        get {
          return (resultMap["terms"] as! [ResultMap]).map { (value: ResultMap) -> Term in Term(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Term) -> ResultMap in value.resultMap }, forKey: "terms")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var baseModelFields: BaseModelFields {
          get {
            return BaseModelFields(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct CreatorUser: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(BaseModelFields.self),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, created: String, changed: String, isDeleted: Bool, username: String, email: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "created": created, "changed": changed, "isDeleted": isDeleted, "username": username, "email": email])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// User's unique handle.
        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        /// User's unique email address.
        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var baseModelFields: BaseModelFields {
            get {
              return BaseModelFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Term: GraphQLSelectionSet {
        public static let possibleTypes = ["StudyTerm"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(BaseModelFields.self),
          GraphQLField("word", type: .nonNull(.scalar(String.self))),
          GraphQLField("definition", type: .nonNull(.scalar(String.self))),
          GraphQLField("parentSet", alias: "containingSet", type: .nonNull(.object(ContainingSet.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The "word" side of a term.
        public var word: String {
          get {
            return resultMap["word"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "word")
          }
        }

        /// The "definition" side of a term.
        public var definition: String {
          get {
            return resultMap["definition"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "definition")
          }
        }

        /// The set to which the term belongs.
        public var containingSet: ContainingSet {
          get {
            return ContainingSet(unsafeResultMap: resultMap["containingSet"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "containingSet")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var baseModelFields: BaseModelFields {
            get {
              return BaseModelFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }

        public struct ContainingSet: GraphQLSelectionSet {
          public static let possibleTypes = ["StudySet"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(BaseModelFields.self),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("creator", alias: "creatorUser", type: .nonNull(.object(CreatorUser.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Title for the set.
          public var title: String {
            get {
              return resultMap["title"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          /// Optional description for the set.
          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// The user who created the set.
          public var creatorUser: CreatorUser {
            get {
              return CreatorUser(unsafeResultMap: resultMap["creatorUser"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "creatorUser")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var baseModelFields: BaseModelFields {
              get {
                return BaseModelFields(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }

          public struct CreatorUser: GraphQLSelectionSet {
            public static let possibleTypes = ["User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(BaseModelFields.self),
              GraphQLField("username", type: .nonNull(.scalar(String.self))),
              GraphQLField("email", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, created: String, changed: String, isDeleted: Bool, username: String, email: String) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "created": created, "changed": changed, "isDeleted": isDeleted, "username": username, "email": email])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// User's unique handle.
            public var username: String {
              get {
                return resultMap["username"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "username")
              }
            }

            /// User's unique email address.
            public var email: String {
              get {
                return resultMap["email"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "email")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var baseModelFields: BaseModelFields {
                get {
                  return BaseModelFields(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }
      }
    }
  }
}

public struct BaseModelFields: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment baseModelFields on ServiceModel {\n  __typename\n  id\n  created\n  changed\n  isDeleted\n}"

  public static let possibleTypes = ["StudySet", "StudyTerm", "User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("created", type: .nonNull(.scalar(String.self))),
    GraphQLField("changed", type: .nonNull(.scalar(String.self))),
    GraphQLField("isDeleted", type: .nonNull(.scalar(Bool.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public static func makeStudySet(id: GraphQLID, created: String, changed: String, isDeleted: Bool) -> BaseModelFields {
    return BaseModelFields(unsafeResultMap: ["__typename": "StudySet", "id": id, "created": created, "changed": changed, "isDeleted": isDeleted])
  }

  public static func makeStudyTerm(id: GraphQLID, created: String, changed: String, isDeleted: Bool) -> BaseModelFields {
    return BaseModelFields(unsafeResultMap: ["__typename": "StudyTerm", "id": id, "created": created, "changed": changed, "isDeleted": isDeleted])
  }

  public static func makeUser(id: GraphQLID, created: String, changed: String, isDeleted: Bool) -> BaseModelFields {
    return BaseModelFields(unsafeResultMap: ["__typename": "User", "id": id, "created": created, "changed": changed, "isDeleted": isDeleted])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The object's unique identifier.
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The date on which the object was created.
  public var created: String {
    get {
      return resultMap["created"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "created")
    }
  }

  /// The date on which the object was last changed.
  public var changed: String {
    get {
      return resultMap["changed"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "changed")
    }
  }

  /// Whether the object has been deleted. (Soft deletion.)
  public var isDeleted: Bool {
    get {
      return resultMap["isDeleted"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "isDeleted")
    }
  }
}