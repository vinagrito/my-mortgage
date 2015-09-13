@LaneList = React.createClass
  render: ->
    lanes = for i in [0...@props.laneCount]
      `<Lane key={i} />`

    `<table className="table table-striped table-hover">
      <thead>
        <tr>
          <th className="col-lg-3"></th>
          <th className="col-lg-2"></th>
          <th className="col-lg-1"></th>
          <th className="col-lg-2"></th>
          <th className="col-lg-1"></th>
          <th className="col-lg-1"></th>
          <th className="col-lg-1"></th>
        </tr>
      </thead>
      <tbody>
        { lanes }
      </tbody>
    </table>`
