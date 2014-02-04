class AlphabetController < UIViewController
  def viewDidLoad
    super
    self.title = "Alphabet"
    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight
    self.view.addSubview(@table)

    @table.dataSource = self
    @table.delegate = self

    end
  end

  def tableView(tableView, numberOfRowsInSection: section)
    rows_for_section(section).count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
      cell ||= UITableViewCell.alloc.initWithStyle(
        UITableViewCellStyleDefault,
        reuseIdentifier:@reuseIdentifier)
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.textLabel.text = row_for_index_path(indexPath)
    cell
  end

