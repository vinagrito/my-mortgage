@LaneList = React.createClass
  render: ->
    lanes = for i in [0...@props.laneCount]
      `<Lane key={i} />`

    `<table className="table table-striped table-hover">
      <thead>
        <tr>
          <th>#</th>
          <th>Type</th>
          <th>Amount</th>
          <th>Interest</th>
          <th>Monthly payment</th>
          <th>Term (years)</th>
          <th>Total return</th>
        </tr>
      </thead>
      <tbody>
        { lanes }
      </tbody>
    </table>`
