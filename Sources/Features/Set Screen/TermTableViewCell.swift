import UIKit
import RxSwift

final class TermTableViewCell: UITableViewCell {

    @IBOutlet private var termLabel: UILabel!
    @IBOutlet private var definitionLabel: UILabel!

    private var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()

        disposeBag = DisposeBag()

        termLabel.text = nil
        definitionLabel.text = nil
    }

    /// Configure the cell with the specified view model.
    ///
    /// - Parameter viewModel: The view model that'll provide content for the cell.
    func configure(with viewModel: TermViewModel) {
        viewModel.connect(output: { [weak self] output in
            guard let strongSelf = self else {
                return
            }

            // Word text.
            output.wordText
                .bind(to: strongSelf.termLabel.rx.text)
                .disposed(by: strongSelf.disposeBag)

            // Definition text.
            output.definitionText
                .bind(to: strongSelf.definitionLabel.rx.text)
                .disposed(by: strongSelf.disposeBag)
        })
    }
}
