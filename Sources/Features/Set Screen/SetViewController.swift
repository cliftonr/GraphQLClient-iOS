import UIKit
import Components
import RxCocoa
import RxCoreData
import RxSwift

final class SetViewController: UIViewController {

    /// Set externally after instantiation, because Interface Builder.
    var viewModel: SetViewModel!

    @IBOutlet private var cardCountLabel: UILabel!
    @IBOutlet private var usernameLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!

    @IBOutlet private var tableView: UITableView!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    private func bindViewModel() {
        viewModel.connect(output: { [weak self] output in
            guard let strongSelf = self else {
                return
            }

            // Term count.
            output.termCount
                .bind(to: strongSelf.cardCountLabel.rx.text)
                .disposed(by: strongSelf.disposeBag)

            // User name.
            output.userName
                .debug("output.username", trimOutput: false)
                .bind(to: strongSelf.usernameLabel.rx.text)
                .disposed(by: strongSelf.disposeBag)

            // Set title.
            output.title
                .bind(to: strongSelf.titleLabel.rx.text)
                .disposed(by: strongSelf.disposeBag)

            // Term cells.
            output.terms
                .bind(to:
                    strongSelf.tableView.rx.items(cellIdentifier: TermTableViewCell.defaultReuseIdentifier,
                                                  cellType: TermTableViewCell.self))
                { _, element, cell in
                    let viewModel = TermViewModel(term: element)
                    cell.configure(with: viewModel)
                }
                    .disposed(by: disposeBag)
        })
    }
}
