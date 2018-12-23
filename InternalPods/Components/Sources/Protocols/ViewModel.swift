/// Type which a view model implementation may use to express "no input".
public struct ViewModelInputNone {
    /* noop */
}

/// Protocol to which all view models should conform.
public protocol ViewModel {

    /// A type which specifies the observables that are passed into the view model.
    associatedtype Input

    /// A type which specifies the observables that are obtained from the view model.
    associatedtype Output

    /// Connects the client object to the view model and vise versa.
    ///
    /// - Parameters:
    ///   - inputClosure:   A closure that sends expected input data to the view model.
    ///   - outputClosure:  A closure that receives output data from the view model.
    func connect(input inputClosure: () -> Input, output outputClosure: (Output) -> Void)
}

extension ViewModel where Self.Input == ViewModelInputNone {

    /// Convenience method for view models which do not take input.
    ///
    /// This method forwards `outputClosure` to `connect(input:output:)`.
    ///
    /// - Parameter outputClosure: A closure that receives output data from the view model.
    public func connect(output outputClosure: (Output) -> Void) {
        connect(input: { return ViewModelInputNone() }, output: outputClosure)
    }
}
