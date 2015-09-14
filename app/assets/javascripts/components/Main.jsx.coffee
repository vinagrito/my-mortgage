#= require_tree ./financiation

@Main = React.createClass
  getInitialState: ->
    laneCount: 0
    lanes: [
      { id: -1, modality: "Prime", amount: 333000, rate: 2, monthReturn: 0, bankGain: 0 },
      { id: -2, modality: "Ogen", amount: 333000, rate: 2.5, monthReturn: 0, bankGain: 0 },
    ]

  addLane: ->
    lanes = this.state.lanes
    lastLane = lanes[lanes.length - 1]
    newLane = { id: lastLane.id - 1, modality: "", amount: 333000, rate: 0, monthReturn: 0, bankGain: 0 }
    lanes.push(newLane)
    @setState lanes: lanes

  removeLane: (lane) ->
    lanes = @state.lanes.slice()
    index = lanes.indexOf lane
    lanes.splice index, 1
    @replaceState lanes: lanes

  render: ->
    `<div>
      <h1>Welcome</h1>
      <a className="btn btn-flat btn-success" onClick={this.addLane}>+ Add Lane</a>

      <div className="row">
        <div className="col-lg-10">
          <table className="table table-striped table-hover">
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
            <LaneList lanes={this.state.lanes} onRemoveClick={this.removeLane}/>
          </table>
        </div>
      </div>
    </div>`
